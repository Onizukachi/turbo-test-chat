class RoomsController < ApplicationController
  before_action :authenticate_user!
  include ChatEnv

  def index
    prepare_chat_env
  end

  def create
    @new_room = Room.new room_params

    if @new_room.save
      respond_to do |format|
        flash.now[:notice] = 'Room was successfully created!'
        format.turbo_stream
        format.html { redirect_to rooms_path }
      end
    else
      flash[:alert] = 'Room was not successfully created!'
      redirect_to rooms_path
    end
  end

  def show
    @single_room = Room.find params[:id]
    prepare_chat_env
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
