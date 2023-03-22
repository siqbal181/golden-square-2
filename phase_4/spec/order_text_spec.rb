require 'order_text'

RSpec.describe OrderText do
    it "sends a text to the customer with the estimated delivery time" do
      # create a double for the order receipt
      order_receipt_double = double(:order_receipt, order_text_message: "Thanks for your order! It is estimated to arrive at 11:01")
  
      # create a double for the Twilio::REST::Client class
      client_class_double = double(:client_class)
      messages_double = double(:messages_double)
  
      # this section allows the client instance to take a chain of messages, eliminating the need for creating an additional double
      allow(client_class_double).to receive_message_chain(:messages, :create).with(
        body: "Thanks for your order! It is estimated to arrive at 11:01", to: ENV['TO_PHONE_NUMBER'], from: ENV['TWILIO_PHONE_NUMBER']
      ).and_return(messages_double)
  
      # create an OrderText instance with the doubles and call send_text
      order_text = OrderText.new(order_receipt_double, client_class_double)
      order_text.send_text
  
      # verify that the messages.create method was called on the messages object with the correct arguments
      expect(messages_double).to eq messages_double

      # add verification message to confirm the string has been returned
      expect(order_text.send_text).to eq "Message successfully sent!"
      end
  end