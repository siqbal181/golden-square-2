require 'twilio-ruby'

client = Twilio::REST::Client.new(
    ENV['ACef77e87799aa9019cfe1ad139b56e8e7'],
    ENV['6c1cb7d075aae2fa5eff80420a018e32']
)

message = client.messages.create(
    body: "Hello from Ruby",
    to: ENV['+447469964296'],
    from: ENV['+15177935081']
)

puts message.sid