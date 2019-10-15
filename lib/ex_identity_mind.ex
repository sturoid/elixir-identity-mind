defmodule ExIdentityMind do
  @moduledoc """
  GET, and POST with IdentityMind.
  """

  @doc """
  GET data from IdentityMind.

  Returns `{:ok, data}`
  """
  @spec get(binary()) :: {atom(), any()}
  def get(url) do
    data =
      HTTPoison.get!(api_url(url), request_headers())
      |> Map.get(:body)
      |> Poison.decode!()

    {:ok, data}
  end

  @doc """
  Post data to IdentityMind.
  """
  @spec post(String.t(), any()) :: {atom(), any()}
  def post(url, data) do
    HTTPoison.post(
      api_url(url),
      Poison.encode!(data),
      request_headers()
    )
    |> post_im_response
  end

  def post_document(url, upload_data) do
    HTTPoison.post(
      api_url(url),
      upload_data,
      request_headers()
    )
    |> post_im_response()
  end

  defp request_headers do
    [{"Content-Type", "application/json"}, {"Authorization", access_token()}]
  end

  @spec api_url(binary()) :: binary()
  defp api_url(url) do
    Application.get_env(:ex_identity_mind, :api_url) <> url
  end

  # Responses that come back from IdentityMind on a POST.
  defp post_im_response(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, response_body_value(body)}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "IdentityMind returned status code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}

      _ ->
        {:error, "Internal server error"}
    end
  end

  # If response body is an empty string, just return the string.
  defp response_body_value(body) do
    case body do
      "" -> ""
      _ -> Poison.decode!(body)
    end
  end

  # Get access token string needed for auth in request headers.
  @spec access_token() :: String.t()
  defp access_token do
    username = Application.get_env(:ex_identity_mind, :api_user)
    password = Application.get_env(:ex_identity_mind, :api_key)
    base64_auth_string = Base.encode64("#{username}:#{password}")
    "Basic #{base64_auth_string}"
  end
end
