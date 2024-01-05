class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    room = Room.find params[:room_id]
    @new_message = current_user.messages.build(body: messsage_params[:body], room:)

    if @new_message.save
      respond_to do |format|
        format.turbo_stream

        format.html do
          flash[:notice] = 'Message was successfully sent'
          redirect_to room_path(@new_message.room)
        end
      end
    end
  end

  private

  def messsage_params
    params.require(:message).permit(:body)
  end
end
