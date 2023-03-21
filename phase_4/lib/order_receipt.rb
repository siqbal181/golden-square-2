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

    private
    def sum_order
        store_order_values = order_basket.map do |item|
          price = item[:price]
          quantity = item[:quantity]
          total = price * quantity
        end
    end
end
