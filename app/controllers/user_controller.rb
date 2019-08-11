class UserController < ApplicationController

  def show
    render json: {
      id: 'show_information_about_current_user',
      message: "Your name is #{current_user[:name]}, email is #{current_user[:email]}.",
      name: current_user[:name],
      email: current_user[:email],
    }
  end

  def create
    @new_user = User.create!(user_params)

    render json: {
      id: 'user_created',
      message: "User was succesfully created, here is your access token: #{@new_user.access_token}",
      name: @new_user.name,
      email: @new_user.email,
      access_token: @new_user.access_token
    }
  end

  def update
    current_user.update(user_params)

    render json: {
      id: 'user_updated',
      message: 'Your profile was succesfully updates.'
    }
  end

  def destroy
    current_user.destroy

    render json: {
      id: 'user deleted',
      message: 'Your profile was succesfully deleted.'
    }
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end
