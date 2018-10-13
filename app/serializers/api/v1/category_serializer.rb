class Api::V1::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :sub_categories
  def sub_categories
    object.sub_categories.map do |sub_category|
      Api::V1::SubCategorySerializer.new(sub_category).attributes
    end
  end
end
