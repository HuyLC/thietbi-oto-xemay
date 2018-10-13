# frozen_string_literal: true

class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :price, :rating, :status,
             :description, :origin, :photo_1, :photo_2, :photo_3
end
