class ConversationsController < ApplicationController
    def index
    conversations = Conversation.all
    render json: conversations
  end

  def show
    render json: Conversation.find(params[:id])
  end

  def create
    payload = conversation_params.merge({user_id: active_user.id})
    conversation = Conversation.create(payload)
    if conversation.valid?
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end
  
  private
  
  def conversation_params
    params.permit(:title)
  end
end
