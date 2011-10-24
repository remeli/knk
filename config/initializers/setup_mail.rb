# Gmail SMTP server setup
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :enable_starttls_auto => true,
  :port => 587,
  :authentication => :plain,
  :user_name => "railsexample@gmail.com",
  :password => 'secretpassword123456789'
}