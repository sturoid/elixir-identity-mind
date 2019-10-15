use Mix.Config

config :exvcr,
  response_headers_blacklist: ["Authorization"],
  filter_sensitive_data: [
    # Replace the authentication token in the vcr_cassette files.
    [pattern: "Basic [a-zA-Z0-9]+", placeholder: "<<access_token>>"]
  ]

if File.exists?("config/test.secret.exs") do
  import_config "test.secret.exs"
end
