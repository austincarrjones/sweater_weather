class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, presence: true, confirmation: true

  has_secure_password
end