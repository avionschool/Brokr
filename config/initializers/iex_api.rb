IEX::Api.configure do |config|
    config.publishable_token = ENV['pk_3fac9a23e6694fdcb684099ec25cf67b']
    config.endpoint = 'https://sandbox.iexapis.com/v1' # use sandbox environment
  end