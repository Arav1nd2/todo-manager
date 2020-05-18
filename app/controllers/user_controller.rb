class UserController < ApplicationController
  def index
    render "users/index"
  end

  def new
    render "users/new"
  end

  def create
    # Check for empty values
    new_user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to todos_path
    else
      flash[:auth_error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
