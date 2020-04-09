class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :author, :author_img, :author_id
  # belongs_to :user
  has_many :likes

  def author_img
    object.user.profile_img
  end
  def author
    object.user.username
  end
  def author_id
    object.user.id
  end
end
