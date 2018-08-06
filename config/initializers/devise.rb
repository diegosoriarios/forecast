Devise.setup do |config|
  config.secret_key = '471add2b83a436a57c2d2ea8c5db764a9c7829c41651563cad022fa78b55fd29b43aaf2433cd03bd04e64b047c208f26446659c11cc5c341c3f6756769fb5752'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.scoped_views = true
  config.sign_out_via = [:delete, :get]
end
