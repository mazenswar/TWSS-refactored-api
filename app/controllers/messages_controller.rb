class MessagesController < ApplicationController
  def create
    payload = message_params.merge({user_id: active_user.id})
    message = Message.create(payload)
    conversation = Conversation.find(message_params[:conversation_id])
    
    if message.valid?
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
    ).serializable_hash
    MessagesChannel.broadcast_to conversation, serialized_data
    head :ok
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:text, :conversation_id)
  end
end
