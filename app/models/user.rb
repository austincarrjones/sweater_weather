class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, presence: true

  before_create :generate_api_key

  has_secure_password

  private
  
  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end