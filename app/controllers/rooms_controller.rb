class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all_except current_user
    @rooms = Room.public_rooms
    @new_room = Room.new
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
    @users = User.all_except current_user
    @rooms = Room.public_rooms
    @new_room = Room.new
    @single_room = Room.find params[:id]
    @message = Message.new

    render :index
  end
end
