class ChatChannel < ActionCable::Channel::Base
  extend Turbo::Streams::Broadcasts, Turbo::Streams::StreamName
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    room = Room.find_by_name params['room']

    if room.participants.map(&:user).include? current_user
      signed_stream_name = self.class.signed_stream_name room
      verified_name = self.class.verified_stream_name signed_stream_name

      stream_from verified_name
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
