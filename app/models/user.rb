class User < ApplicationRecord

  has_secure_token :access_token

  validates :name, :email, presence: true
  validates :access_token, uniqueness: true

end
