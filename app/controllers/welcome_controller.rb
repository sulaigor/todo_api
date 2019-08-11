class WelcomeController < ApplicationController
  def index
    render json: {
      request: :success,
      message: "Welcome here #{current_user.name}, this is the root page.",
    }
  end
end
