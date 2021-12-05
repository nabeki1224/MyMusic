class EndUsers::ChatsController < ApplicationController
  def index
    @my_chats = current_end_user.chats
    @chat_partners = current_end_user.followings
  end

  def show
    @chat = Chat.new
    @partner = EndUser.find(params[:id])
    @chats_by_myself = Chat.where(end_user_id: current_end_user.id, partner_id: @partner.id)
    @chats_by_other = Chat.where(end_user_id: @partner.id, partner_id: current_end_user.id)
    @chats = @chats_by_myself.or(@chats_by_other)
    @chats = @chats.order(:created_at)
  end
  
  def create
    @chat = Chat.new(chat_params)
    @partner = EndUser.find(params[:chat][:partner_id])
    @chats_by_myself = Chat.where(end_user_id: current_end_user.id, partner_id: @partner.id)
    @chats_by_other = Chat.where(end_user_id: @partner.id, partner_id: current_end_user.id)
    @chats = @chats_by_myself.or(@chats_by_other)
    @chats = @chats.order(:created_at)

    @chat.end_user_id = current_end_user.id
    @chat.save
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:sentence, :partner_id)
  end
end
