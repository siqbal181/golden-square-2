class OrderReceipt
    def initialize(order, io) # instance of order
        @order = order
        @io = io
    end

    def order_basket
        @order.order_basket
    end

    def receipt
        @io.puts "Thanks for your order. Please find your receipt below:"
        order_basket.each do |item|
          @io.puts "#{item[:name]} x #{item[:quantity]}"
        end
        @io.puts "Your order amounts to £#{sum_order.sum.round(2)}"
    end

    def order_text_message
        delivery_time = @order.order_time + (45 * 60) # add 45 mins to order by 45 * 60 seconds
        formatted_delivery_time = delivery_time.strftime("%H:%M")
        @io.puts "Thanks for your order! It is estimated to arrive at #{formatted_delivery_time}"
    end

    private
    def sum_order
        store_order_values = order_basket.map do |item|
          price = item[:price]
          quantity = item[:quantity]
          total = price * quantity
        end
    end
end
