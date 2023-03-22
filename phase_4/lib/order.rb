require 'time'

class Order
    def initialize(io)
        @io = io
        @order_basket = []
        @order_time = nil
    end

    def list_dishes
        [{:name => "1. Pepperoni Pizza", :price => 10.99},
        {:name => "2. Beef Burger", :price => 13.99},
        {:name => "3. Caprese Salad", :price => 7.99},
        {:name => "4. Garlic Bread", :price => 4.99},
        {:name => "5. Fried Calzone", :price => 15.99}]
    end

    def format_menu # showing the menu in formatted form
        list_dishes.map {|item| "#{item[:name]} - £#{item[:price].round(2)}"}.join("\n")
    end

    def select_dishes
        loop do
          @io.puts "Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)"
          @io.puts format_menu    # (list dishes in format perspective)
          dish_item = @io.gets.chomp
          if dish_item == "Order Complete"
            @order_time = Time.now()
            break
          end
          dish_item = dish_item.to_i
      
          if (1..5).include?(dish_item)
            @io.puts "Please select your quantity for menu item #{dish_item}:"
            dish_quantity = @io.gets.to_i
      
            selected_dish = list_dishes[dish_item - 1]
            dish_name = selected_dish[:name]
            dish_price = selected_dish[:price]
      
            dish_selection = { name: dish_name, price: dish_price, quantity: dish_quantity }
            @order_basket << dish_selection
          else
            @io.puts "Invalid selection. Please choose a number from 1 to 5."
          end
        end
        "Order complete!"
      end

    def order_basket
        @order_basket
    end

    def order_time
        @order_time
    end
end
