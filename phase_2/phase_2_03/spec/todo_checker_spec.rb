require "todo_checker"

RSpec.describe "todo checker method" do
    it "checks if a string contains a todo and returns true if so" do
        expect(todo_checker("this is a TODO")).to eq true
    end
end