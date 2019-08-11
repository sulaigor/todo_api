class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequestService.new(request.headers).call
    render json: {
      error: 'Not authorized',
      page: params[:controller]
    }, status: 401 unless @current_user
  end

end
