class Room < ApplicationRecord
  has_many :users
  has_many :messages

  attr_accessor :recipient

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }

  scope :public_rooms, -> { where(is_private: false) }

  def full_title
    recipient && is_private ? recipient : name
  end
end
