class MessagesController < ApplicationController
  respond_to :html, :js

  def new
    @parent_id = params[:parent_id] # we need to have parent ID in nested messages form
    @message = Message.new()
  end

  def index
    @message = Message.new
    @messages = Message.hash_tree(limit_depth: 5)

  end

  def create
    parent_id = params[:message][:parent_id].to_i
    if  parent_id > 0
      parent = Message.find_by_id(parent_id)
      message = parent.children.build(message_params)
    else
      message = current_user.messages.build(message_params)
    end

    #Before save message, message has DEPTH == 0, so we should check parent DEPTH

    if message.parent.nil? # If message has 0 level, than it doesn't have parent, so we can save it
      message.save
      flash[:success] = "Your comment was successfully added!"
      @messages = Message.hash_tree(limit_depth: 5)
    elsif message.parent.depth < 4 # Check if message parent has less than 4 level => message has less than 5 level
      message.save
      flash[:success] = "Your comment was successfully added!"
      @messages = Message.hash_tree(limit_depth: 5)
    else                                                  # If message will have 5-th level we don't save it.
      @messages = Message.hash_tree(limit_depth: 5)
      flash[:danger] = "Sorry, no more than 5 descendants!"
    end
  end

  def edit
    @message = Message.find(params[:id])
    @message.parent.nil? ? @parent_id = '' : @parent_id = @message.parent.id
  end

  def update
    message = Message.find(params[:id])
    if message.update_attributes(message_params)
      @messages = Message.hash_tree(limit_depth: 5)
      flash[:success] = "Your comment was successfully edited!"
    else
      flash[:danger] = "Your comment was successfully edited!"
    end
  end
end

private

def message_params
  params.require(:message).permit(:content,:parent_id,:user_id)
end
