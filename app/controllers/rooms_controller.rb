class RoomsController < ApplicationController
  before_action :authenticate_user!
  include ChatEnv

  def index
    prepare_chat_env
  end

  def create
    @new_room  = Room.create name: params[:room][:name]

    if @new_room.save
      flash[:notice] = 'Room was successfully created!'
      redirect_to rooms_path
    else
      flash[:alert] = 'Room was not successfully created!'
      redirect_to rooms_path
    end
  end

  def show
    @single_room = Room.find params[:id]
    prepare_chat_env
  end
end
