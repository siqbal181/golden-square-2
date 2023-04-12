class Todo
    def initialize(task) # task is a string
      @task = task
      @complete_todo = false
    end
  
    def task
      @task
    end
  
    def mark_done!
      @complete_todo = true
    end
  
    def done?
      if @complete_todo == true
        return true
      else
        return false
      end
    end
  end