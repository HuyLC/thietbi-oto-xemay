class Api::V1::SubCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :products
end
