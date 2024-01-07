class UsersController < ApplicationController
  include ChatEnv

  def chat
    @user = User.find params[:id]
    room_name = make_room_name
    @single_room = Room.find_by_name(room_name) || Room.create_private_room([@user, current_user], room_name)
    @single_room.recipient = @user.email

    prepare_chat_env
  end

  private

  def make_room_name
    users = [@user, current_user].sort
    "private_#{users.map(&:id).join('_')}"
  end
end