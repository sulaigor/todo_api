class User < ApplicationRecord

  # has_secure_token :access_token
  before_create :set_uuid

  validates :name, :email, presence: true
  validates :access_token, :email, uniqueness: true

  private

  def set_uuid
    self.access_token = UUID.generate unless self.access_token.present?
  end

end
