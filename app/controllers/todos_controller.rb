class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.all.map { |todo| todo.to_pleasent_string }.join("\n")
    render "index"
  end

  def show
    todo = Todo.find(params[:id]).to_pleasent_string
    render plain: "#{todo}"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    redirect_to todos_path
  end

  def update
    new_status = params[:status]
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = new_status
    todo.save
    redirect_to todos_path
    # render plain: "Todo with id : #{id} update as : Completed: #{new_status}"
  end

  def destroy
    id = params[:id]
    Todo.find(id).destroy
    redirect_to todos_path
  end
end
