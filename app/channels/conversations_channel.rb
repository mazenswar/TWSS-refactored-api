class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_channel"
  end

  def unsubscribed
    raise "unsubscribed successfully"
  end
end
