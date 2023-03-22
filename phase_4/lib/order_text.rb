class OrderText
    def initialize(order_receipt, client_class = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']))
      @client = client_class
      @order_receipt = order_receipt # this is the order receipt to return order message
    end
  
    def send_text
      message = @client.messages.create(
        body: @order_receipt.order_text_message,
        to: ENV['TO_PHONE_NUMBER'],
        from: ENV['TWILIO_PHONE_NUMBER']
      )
      return "Message successfully sent!" if message
    end
  end
  