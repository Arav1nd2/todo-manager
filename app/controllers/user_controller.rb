class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_string }.join("\n")
  end

  def hash_password!(password)
    # Add some custom logic or use some library like bcrypt
    "#{Time.now.getutc}^#{password}"
  end

  def compare_password(db_password, entered_password)
    pass = db_password.split("^")[1]
    if pass == entered_password
      true
    else
      false
    end
  end

  def create
    # Check for empty values
    name = params[:name].empty?
    email = params[:email].empty?
    password = params[:password].empty?
    puts "#{name}, #{email}, #{password}"
    if !name && !email && !password
      # Hash the password before adding!
      encrypted_password = hash_password!(params[:password])
      new_user = User.create!(name: params[:name], email: params[:email], password: encrypted_password)
      render plain: "A new User with id: #{new_user.id} has been created!"
    else
      render plain: "Please enter all the required fields"
    end
  end

  def login
    email = params[:email]
    pass = params[:password]
    user = User.where("email = ?", email).first

    if user
      render plain: compare_password(user.password, pass)
    else
      render plain: "No user found"
    end
  end
end
