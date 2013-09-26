require "sinatra"
require "sinatra/reloader"

# Gem for sending mail
require 'mail'

# JSON parsing gem
require 'json'

# Gem used for debugging
require "pry"

# API POST method
post "/send" do

  # Get data from user
  mail = JSON.parse(params.keys.first)

  # Make sure there are some default values
  mail[:to] ||= "frankywahl@gmail.com"
  mail[:from] ||= "frankywahl@gmail.com"
  mail[:subject] ||= "A subject"
  mail[:body] ||= "Body"

  # Create email object
  email = Mail.new do
    from     mail[:from]
    to       mail[:to]
    subject  mail[:subject]
    body     mail[:body]
  end

  # Make sure it uses sendmail
  email.delivery_method :sendmail

  # Actually send the e-mail
  email.deliver

end