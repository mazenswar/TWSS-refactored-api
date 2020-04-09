class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :sender

  def sender
    object.user.username
  end
  has_one :user
  has_one :conversation
end
