require 'order_text'

RSpec.describe OrderText do
  it "sends a text to the customer with the estimated delivery time" do
    # create a double for the order receipt
    order_receipt_double = double(:order_receipt, order_text_message: "Thanks for your order! It is estimated to arrive at 11:01")

    # create a double for the Twilio::REST::Client class
    client_class_double = double(:client_class)
    client_instance_double = double(:client_instance)
    allow(client_class_double).to receive(:new).and_return(client_instance_double)

    # create a double for the messages object on the client instance
    messages_double = double(:messages)
    allow(client_instance_double).to receive(:messages).and_return(messages_double)

    # create an OrderText instance with the doubles
    order_text = OrderText.new(order_receipt_double, client_class_double)

    # call the send_text method
    order_text.send_text

    # verify that the client instance was created with the correct arguments
    expect(client_class_double).to have_received(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    # verify that the messages.create method was called on the messages object with the correct arguments
    expect(messages_double).to have_received(:create).with(
      body: "Thanks for your order! It is estimated to arrive at 11:01",
      to: ENV['TO_PHONE_NUMBER'],
      from: ENV['TWILIO_PHONE_NUMBER']
    )
  end
end


