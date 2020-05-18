class TodosController < ApplicationController
  before_action :authenticate

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
    due_date = params[:due_date]
    id = current_user.id
    new_todo = Todo.new(todo_text: todo_text, due_date: due_date, completed: false, user_id: current_user.id)
    if new_todo.save
      redirect_to todos_path
    else
      flash[:todo_error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
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
    Todo.where("id = ?", id).destroy_all
    redirect_to todos_path
  end

  def authenticate
    if current_user
      return
    else
      redirect_to login_path
    end
  end
end
