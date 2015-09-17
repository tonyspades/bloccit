if Rails.env.production?
  config_path = File.expand_path(Rails.root.to_s + '/config/secrets.yml')
  if File.exists? config_path
    ENV.update YAML.load_file(config_path)[Rails.env]
  end
  
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['SENDGRID_USERNAME'],
    password:       ENV['SENDGRID_PASSWORD'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end