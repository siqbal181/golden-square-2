# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.

> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.

# Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```ruby
class Order
    def initialize
        @order_basket = []
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
            puts "Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)"
            format_menu    # (list dishes in format perspective)
            dish_item = gets.chomp
            if dish_item == "Order Complete"
                break
            end
            puts "Please select your quantity for menu item #{dish_item}?"
            dish_quantity = gets.to_i

            # add the selected dish to the order basket
            if dish_item == 1
                @order_basket << list_dishes[0]
            else
                dish_selection = { dish_item: dish_item.to_i, quantity: dish_quantity }
                @order_basket << dish_selection
            end
        end
        return "Order complete"
    end

    def finalise_order
        @order_basket # this is just so that the OrderReciept can use it
    end
end


class OrderReceipt
    def initialize(order) # instance of order
        @order = order
    end

    def receipt
        # puts "Thank you for your order:"
        # Iterate through the order_basket with quantity and item
        # price of items
    end

    private
    def sum_order
        
    end
end

# require twilio
require 'twilio-ruby'

class OrderText
    def initialize(order) # order is an instance of Order class
        @order = order
    end

    def send_text
        # returns : Thank you! Your order was placed and will be delivered before #{order_time + 30 minutes}" 
    end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# 1) Return a receipt after a new order has been placed
order = Order.new
order.select_order
expect(order.order_receipt).to eq "Thanks for your order, your order is Pepperoni Pizza x 2 and your total is £23.99"



```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# Order Class

# # 1) Show the menu
# order = Order.new
# expect(order.format_menu).to eq "1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99"

# # 2) Select dishes and complete an order
# io = double :io
# order = Order.new(io)
# expect(io).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)")

# # 3) Return an empty order basket first instance
# io = double :io
# order = Order.new(io)
# expect(order.order_basket).to eq []

# Need to complete
# 3) Typing a number which is not a menu-item number
# expect(io).to receive(:puts).with("Invalid selection. Please choose a number from 1 to 5.").ordered


# 4) When a person types a menu item twice in the same run (adding to existing quantity hash)
# 5) When a person types "Order Complete" without ordering any items




```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
