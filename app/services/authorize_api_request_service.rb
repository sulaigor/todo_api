class AuthorizeApiRequestService

  def initialize(headers = {})
    @headers = headers
    @access_token = http_authorizate_header
  end

  def call
    @user ||= User.find_by(access_token: @access_token) if @access_token
    # @user || errors.add(:token, 'Invalid token') && nil
  end

  private

  def http_authorizate_header
    if @headers.key?(:authorization)
      @headers[:authorization].split(' ').last
    else
      # errors.add(:token, 'Missing token')
      nil
    end
  end

end
