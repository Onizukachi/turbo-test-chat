class Room < ApplicationRecord
  has_many :users
  has_many :messages

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }

  scope :public_rooms, -> { where(is_private: false) }
end
