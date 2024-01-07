class UsersController < ApplicationController
  include ChatEnv

  def chat
    @user = User.find params[:id]
    room_name = make_room_name
    @single_room = Room.find_or_create_by(name: room_name, is_private: true)
    @single_room.recipient = @user.email

    prepare_chat_env
  end

  private

  def make_room_name
    users = [@user, current_user].sort
    "private_#{users.map(&:id).join('_')}"
  end
end