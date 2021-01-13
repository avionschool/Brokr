# Load the Rails application.
require_relative 'application'

# require 'iex-ruby-client'


# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    user_name: 'apikey',
    password: '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',
    domain: 'http://localhost:3000/',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
}


