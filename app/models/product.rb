class Product < ApplicationRecord
  include Archivable
  include Meilisearch::Rails
  belongs_to :company
  has_many :quote_items, as: :allocatable
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :quote_items, as: :allocatable
  enum :category_price, { hourly: 0, unit: 1 }

  meilisearch do
    attribute :name
    ranking_rules %w[words typo proximity attribute sort exactness]
    searchable_attributes [ :name ]
    filterable_attributes [ :name ]
    sortable_attributes [ :created_at ]
    displayed_attributes [ :id, :name ]
  end
end
