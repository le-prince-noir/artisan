# require 'net/smtp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#     def send_email(to,opts={})
#       opts[:server]      ||= '127.0.0.1'
#       opts[:from]        ||= 'samy-kantari@cifacom.com'
#       opts[:from_alias]  ||= 'Example Emailer'
#       opts[:subject]     ||= "You need to see this"
#       opts[:body]        ||= "Important stuff!"

#   msg = <<END_OF_MESSAGE
# From: #{opts[:from_alias]} <#{opts[:from]}>
# To: <#{to}>
# Subject: #{opts[:subject]}

# #{opts[:body]}
# END_OF_MESSAGE

#       Net::SMTP.start(opts[:server]) do |smtp|
#         smtp.send_message msg, opts[:from], to
#       end
#     end
end
