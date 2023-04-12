require "todo"

RSpec.describe Todo do
    it "returns the todo task" do
        todo = Todo.new("Go to the shops")
        expect(todo.task).to eq "Go to the shops"
    end

    it "marks a task as done" do
        todo = Todo.new("Close bank account")
        expect(todo.mark_done!).to eq true
    end

    it "check if a task is done and returns true" do
        todo = Todo.new("Close bank account")
        todo.mark_done!
        expect(todo.done?).to eq true
    end

    it "check if a task is done and returns false if not" do
        todo = Todo.new("Close bank account")
        expect(todo.done?).to eq false
    end
end