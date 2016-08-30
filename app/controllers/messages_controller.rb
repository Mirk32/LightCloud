class MessagesController < ApplicationController
  respond_to :html, :js
  def index
    @message = Message.new
    @messages = Message.all.reverse_order
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      @messages = Message.all.reverse_order
      flash[:success] = "Your message was successfully added!"
    else
      render root_path
    end
  end
end

private

def message_params
  params.require(:message).permit(:content)
end
