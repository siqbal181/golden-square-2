require "order"

RSpec.describe Order do
    it "lists dish items" do
        io = double :io
        order = Order.new(io)
        expect(order.format_menu).to eq "1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99"
    end

    it "initially returns an empty order basket" do
        io = double :io
        order = Order.new(io)
        expect(order.order_basket).to eq []
    end

    it "allows user to select dishes until they type Order Complete" do
        io = double :io
        expect(io).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
        expect(io).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
        expect(io).to receive(:gets).and_return("2").ordered
        expect(io).to receive(:puts).with("Please select your quantity for menu item 2:").ordered
        expect(io).to receive(:gets).and_return("1\n").ordered # add \n to simulate "Enter" key press
        expect(io).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
        expect(io).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
        expect(io).to receive(:gets).and_return("Order Complete").ordered        
        order = Order.new(io)
        order.select_dishes
        expect(order.order_basket).to eq([{name: "2. Beef Burger", price: 13.99, quantity: 1}])
      end
      
      it "asks user to enter a valid number when typing a non-menu item number" do
        io = double :io
        expect(io).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
        expect(io).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
        expect(io).to receive(:gets).and_return("7").ordered
        expect(io).to receive(:puts).with("Invalid selection. Please choose a number from 1 to 5.").ordered
        expect(io).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
        expect(io).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
        expect(io).to receive(:gets).and_return("1").ordered
        expect(io).to receive(:puts).with("Please select your quantity for menu item 1:").ordered
        expect(io).to receive(:gets).and_return("1").ordered
        expect(io).to receive(:puts).with("Select a dish by typing a number 1-5 (Type \"Order Complete\" when done)").ordered
        expect(io).to receive(:puts).with("1. Pepperoni Pizza - £10.99\n2. Beef Burger - £13.99\n3. Caprese Salad - £7.99\n4. Garlic Bread - £4.99\n5. Fried Calzone - £15.99").ordered
        expect(io).to receive(:gets).and_return("Order Complete").ordered        
        order = Order.new(io)
        order.select_dishes
      end

end
