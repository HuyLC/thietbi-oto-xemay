# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :sub_category

  scoped_search on: %i[name slug]
  scope :order_by, ->(column, sort) { order(column => sort) }
  scope :randomize, -> { order('rand()') }
  before_save :set_image_by_params_image
  mount_uploader :photo_1, ProductPhotoUploader
  mount_uploader :photo_2, ProductPhotoUploader
  mount_uploader :photo_3, ProductPhotoUploader
  attr_accessor :image_data

  def related
    Product.where('products.id <> ? and products.sub_category_id = ?', id, sub_category_id)
           .group(:id)
           .randomize
           .limit(12)
  end

  private

  def set_image_by_params_image
    self.photo_1, self.photo_2, self.photo_3 = ConvertImage.new(image_data).convert unless image_data.nil?
  end
end
