class FeministSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_img, :index_img, :bio, :philosophy
  has_many :quotes

end
