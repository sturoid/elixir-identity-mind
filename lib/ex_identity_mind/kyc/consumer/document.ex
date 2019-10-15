defmodule ExIdentityMind.KYC.Consumer.Document do
  @moduledoc """
  Document for KYC consumer application. "appId" is the "transaction_id" of the application.
  Document upload data must be encoded as multipart/form-data in the POST request.

  More info: https://documentation.identitymindglobal.com/api/#kyc:-consumer-application
  """
  @type t :: %__MODULE__{
          # REQUIRED: The application ID the file will be uploaded to.
          appId: integer,
          # The file to be uploaded.
          file: any(),
          # The file description.
          description: String.t()
        }

  @enforce_keys [:appId, :file]
  defstruct [
    :appId,
    :file,
    :description
  ]
end
