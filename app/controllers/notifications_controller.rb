class NotificationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def notify
        client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
        
        
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        client = Twilio::REST::Client.new(account_sid, auth_token)

        message = @client.messages.create(
                             from: '+17206053308',
                             body: 'body',
                             to: '+61468757015'
                           )
    end
end