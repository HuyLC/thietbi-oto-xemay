class SubCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :category
  has_many :products, dependent: :destroy

  %i[name].each do |e|
    validates_presence_of e
  end

  before_save :set_slug

  rails_admin do
    update do
      field :name
      field :category
    end
    create do
      field :name
      field :category
    end
    list do
      field :id
      field :name
      field :category
      field :products
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
