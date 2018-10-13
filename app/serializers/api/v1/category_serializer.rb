class Api::V1::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :sub_categories
end
