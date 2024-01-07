class Room < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
  has_many :messages, dependent: :destroy

  attr_accessor :recipient

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }

  after_create_commit { broadcast_if_public }

  scope :public_rooms, -> { where(is_private: false) }

  def full_title
    recipient && is_private ? recipient : name
  end

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)

    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id )
    end

    single_room
  end

  private

  def broadcast_if_public
    broadcast_append_to "public_rooms", target: 'public_rooms', partial: 'rooms/room_link' unless self.is_private
  end
end
