require 'twilio-ruby'

client = Twilio::REST::Client.new(
    ENV['XX'],
    ENV['XX']
)

message = client.messages.create(
    body: "Hello from Ruby",
    to: ENV['+447469964296'],
    from: ENV['+15177935081']
)

puts message.sid