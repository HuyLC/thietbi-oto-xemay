# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :sub_categories, dependent: :destroy
  has_many :products, through: :sub_categories

  %i[name].each do |e|
    validates_presence_of e
  end

  scope :asc, -> { order(name: :asc) }
  scope :desc, -> { order(name: :desc) }

  before_save :set_slug

  rails_admin do
    update do
      field :name
    end
    create do
      field :name
    end
    list do
      field :id
      field :name
      field :sub_categories
      field :slug
      field :created_at
      field :updated_at
    end
  end

  private

  def set_slug
    self.slug = name.downcase.tr(' ', '-')
  end
end
