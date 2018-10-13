# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :sub_categories, dependent: :destroy
  has_many :products, through: :sub_categories

  scope :asc, -> { order(name: :asc) }
  scope :desc, -> { order(name: :desc) }
end
