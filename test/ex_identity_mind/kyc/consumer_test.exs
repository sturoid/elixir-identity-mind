defmodule ExIdentityMind.KYC.ConsumerTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  @transaction_id "7b1c3332b213418788e26f0d470bb8c6"

  setup_all do
    HTTPoison.start()
  end

  test "submit application" do
    use_cassette("kyc/consumer/application") do
      valid_application = %ExIdentityMind.KYC.Consumer.Application{
        dob: "1941-09-03",
        assn: "US:123456789",
        assnl4: "6789",
        title: "Martha Stewart",
        man: "Marth Stewart Account",
        tea: "martha@marthastewart.com"
      }

      {:ok, submission} = ExIdentityMind.KYC.Consumer.submit(valid_application)

      refute is_nil(submission)
      refute is_nil(submission["tid"])
      assert submission["res"] == "ACCEPT"
    end
  end

  test "retrieve application status by transaction_id" do
    use_cassette("kyc/consumer/status#7b1c3332b213418788e26f0d470bb8c6") do
      {:ok, status} = ExIdentityMind.KYC.Consumer.status(@transaction_id)
      refute is_nil(status)
      refute is_nil(status["tid"])
    end
  end

  test "add document to application" do
    use_cassette("kyc/consumer/add_document#7b1c3332b213418788e26f0d470bb8c6") do
      file_path = Path.expand('./test/fixtures/dl.jpg') |> Path.absname()

      document_upload =
        {:multipart,
         [
           {"appId", @transaction_id},
           {"description", "Driver's license"},
           {:file, file_path,
            {"form-data", [{:name, "file"}, {:filename, Path.basename(file_path)}]}, []}
         ]}

      {:ok, result} = ExIdentityMind.KYC.Consumer.add_document(@transaction_id, document_upload)

      refute(is_nil(result))
      assert result["filename"] == "dl.jpg"
      assert result["success"] == "file saved"
    end
  end
end
