class User < ApplicationRecord
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :all_except, ->(user) { where.not(id: user) }
end
