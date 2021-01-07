ActionMailer::Base.smtp_settings = {
    domain: 'http://localhost:3000/',
    address: "smtp.sendgrid.net",
    port: 587,
    authentication: :plain,
    user_name: 'apikey',
    password: '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',
  }