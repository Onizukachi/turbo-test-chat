class Message < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :room

  validates :body, presence: true

  after_create_commit -> { broadcast_append_to(room, channel: ChatChannel, target: dom_id(room, :messages)) }
end
