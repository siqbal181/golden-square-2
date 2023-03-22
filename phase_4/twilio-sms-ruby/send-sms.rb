require 'twilio-ruby'

client = Twilio::REST::Client.new(
    ENV['TWILIO_ACCOUNT_SID'],
    ENV['TWILIO_AUTH_TOKEN']
)

message = client.messages.create(
    body: "Hello from Ruby",
    to: ENV['TO_PHONE_NUMBER'],
    from: ENV['TWILIO_PHONE_NUMBER']
)

puts message.sid