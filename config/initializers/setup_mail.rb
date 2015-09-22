ActionMailer::Base.smtp_settings = {
  port:              2525,
  address:           'smtp.mailgun.org',
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            'theusthread.com',
  authentication:    :plain,
  content_type:      'text/html'
}

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true
