# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :sub_category

  scoped_search on: %i[name slug]
  scope :order_by, ->(column, sort) { order(column => sort) }
  scope :randomize, -> { order('rand()') }

  def related
    Product.where('products.id <> ? and products.sub_category_id = ?', id, sub_category_id)
           .group(:id)
           .randomize
           .limit(12)
  end
end
