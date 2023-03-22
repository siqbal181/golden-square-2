require 'twilio-ruby'

class OrderText
    def initialize(order_receipt, client_class = Twilio::REST::Client)
      @client = client_class.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      @order_receipt = order_receipt # this is the order receipt to return order message
    end
  
    def send_text(message)
      message = @client.messages.create(
        body: "#{@order_receipt.order_text_message}",
        to: ENV['TO_PHONE_NUMBER'],
        from: ENV['TWILIO_PHONE_NUMBER']
      )
    end
  end
  

# pass in twilio client similar to io
# pass in a mock client
# pass in a class itslef into the OrderText - client class // default to Twilio:: REST:: Client
# @client = client_class.new(EV, AUTH_TOKEN)
# Was the mock class initialized with the right variable
# did mockclass.send_text 
# We want to make sure our Ordertext is calling the right message on the right client and has the right argument
# instance_double = double(:message => true)
# MockClass = double(:new => instance_double)
# double(:new => )

# test

# order_text = OrderText.new(order_receipt, MockClass)
# order_text.message()
# expect(instance_double.message).to  have_been_called_with({to: 'number'})