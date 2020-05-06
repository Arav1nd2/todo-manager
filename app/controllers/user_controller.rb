class UserController < ApplicationController
  def index
    render "users/index"
  end

  def new
    render "users/new"
  end

  def create
    # Check for empty values
    name = params[:name].empty?
    email = params[:email].empty?
    password = params[:password].empty?
    puts "#{name}, #{email}, #{password}"
    if !name && !email && !password
      new_user = User.create!(name: params[:name], email: params[:email], password: params[:password])
      session[:user_id] = new_user.id
      redirect_to todos_path
    else
      render plain: "Please enter all the required fields"
    end
  end
end
