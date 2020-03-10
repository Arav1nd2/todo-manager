class Todo < ActiveRecord::Base
  def to_pleasent_string
    finished = completed == false ? "[ ]" : "[X]"
    "#{id}. #{finished} #{todo_text} , #{due_date.to_s(:short)}"
  end
end
