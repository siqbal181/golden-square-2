require "todo"
require "todo_list"

RSpec.describe "integration test" do
    context "when a todo is created" do
        xit "gets added to the todo list" do
            todo_list = TodoList.new
            todo_1 = Todo.new("Go to sleep as you are sleepy")
            todo_2 = Todo.new("Eat something as you are hungry")
            todo_3 = Todo.new("Take a break from coding")
            todo_1.mark_done!

        end
    end
end