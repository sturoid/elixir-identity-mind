defmodule ExIdentityMind.KYC.Consumer do
  alias ExIdentityMind.KYC.Consumer.Application, as: App
  alias ExIdentityMind.KYC.Consumer.Status, as: AppStatus
  # alias ExIdentityMind.KYC.Consumer.Document, as: AppDocument

  @doc """
  Submit a KYC consumer application.
  """
  @spec submit(App.t()) :: {atom(), %AppStatus{}}
  def submit(%App{} = application) do
    ExIdentityMind.post("account/consumer", application)
  end

  @doc """
  Retrieve the status data for a submitted KYC consumer application.
  """
  @spec status(String.t()) :: {atom(), %AppStatus{}}
  def status(transaction_id \\ "") do
    ExIdentityMind.get("account/consumer/#{transaction_id}")
  end

  @doc """
  Add a document to an existing KYC consumer application.
  """
  @spec add_document(String.t(), any()) :: {atom(), any()}
  def add_document(transaction_id \\ "", document) do
    ExIdentityMind.post_document("account/consumer/#{transaction_id}/files", document)
  end

  # TODO
  # def retrieve_documents(transaction_id \\ "") do
  #   ExIdentityMind.get("/account/consumer/#{transaction_id}/files")
  # end

  # TODO
  # def download_document(transaction_id \\ "", file_id \\ "") do
  #   ExIdentityMind.get("/account/consumer/#{transaction_id}/files/#{file_id}")
  # end
end
