  IEX::Api.configure do |config|
    config.publishable_token = 'pk_3fac9a23e6694fdcb684099ec25cf67b' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_9d27a9ab69c64168ad4fad54cf700ecb' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
  end