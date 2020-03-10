class TodosController < ApplicationController
  def index
    render plain: Todo.all.map { |todo| todo.to_pleasent_string }.join("\n")
  end

  def show
    todo = Todo.find(params[:id]).to_pleasent_string
    render plain: "#{todo}"
  end
end
