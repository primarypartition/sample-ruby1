# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
   
# sendgrid smtp mailer for heroku
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'sample-ruby1-tasweer.herokuapp.com',
  :enable_starttls_auto => true
}
