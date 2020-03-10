class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_string }.join("\n")
  end

  def create
    # Hash the password before adding!
    new_user = User.create!(name: params[:name], email: params[:email], password: params[:password])
    render plain: "A new User with id: #{new_user.id} has been created!"
  end

  def login
  end
end
