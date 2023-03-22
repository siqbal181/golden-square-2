require "order"
require "order_receipt"
require "order_text"

RSpec.describe "integration test" do
    context "given an order is placed by a customer" do
        it "returns an itemised list with order total" do
            io_1 = double :io # this is for the puts and gets from the Order class
            io_2 = double :io # this is for the puts statement on the OrderReceipt class
            fixed_time = Time.parse("2022-01-01 10:16:00") # set a fixed time
            allow(Time).to receive(:now).and_return(fixed_time) # stub Time.now to return fixed_time
            expect(io_1).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
            expect(io_1).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
            expect(io_1).to receive(:gets).and_return("2").ordered
            expect(io_1).to receive(:puts).with("Please select your quantity for menu item 2:").ordered
            expect(io_1).to receive(:gets).and_return("1\n").ordered # add \n to simulate "Enter" key press
            expect(io_1).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
            expect(io_1).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
            expect(io_1).to receive(:gets).and_return("Order Complete").ordered  
            expect(io_2).to receive(:puts).with("Thanks for your order. Please find your receipt below:").ordered
            expect(io_2).to receive(:puts).with("2. Beef Burger x 1").ordered  
            expect(io_2).to receive(:puts).with("Your order amounts to £13.99").ordered  
            order = Order.new(io_1)
            order.select_dishes
            order_receipt = OrderReceipt.new(order, io_2)
            order_receipt.receipt
        end

        it "returns a message when the order will be delivered" do
            io_1 = double :io # this is for the puts and gets from the Order class
            io_2 = double :io # this is for the puts statement on the OrderReceipt class
            fixed_time = Time.parse("2022-01-01 10:16:00") # set a fixed time
            allow(Time).to receive(:now).and_return(fixed_time) # stub Time.now to return fixed_time
            expect(io_1).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
            expect(io_1).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
            expect(io_1).to receive(:gets).and_return("2").ordered
            expect(io_1).to receive(:puts).with("Please select your quantity for menu item 2:").ordered
            expect(io_1).to receive(:gets).and_return("1\n").ordered # add \n to simulate "Enter" key press
            expect(io_1).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
            expect(io_1).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
            expect(io_1).to receive(:gets).and_return("Order Complete").ordered  
            expect(io_2).to receive(:puts).with("Thanks for your order! It is estimated to arrive at 11:01").ordered
            order = Order.new(io_1)
            order.select_dishes
            order_receipt = OrderReceipt.new(order, io_2)
            order_receipt.order_text_message
        end
    end
end