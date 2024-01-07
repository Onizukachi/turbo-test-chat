module ChatEnv
  extend ActiveSupport::Concern

  included do
    def prepare_chat_env
      @users = User.all_except current_user
      @rooms = Room.public_rooms
      @new_room = Room.new
      @message = Message.new

      render 'rooms/index'
    end
  end
end