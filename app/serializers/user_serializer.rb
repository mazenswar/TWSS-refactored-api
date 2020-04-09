class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :profile_img
  has_many :posts

  
end
