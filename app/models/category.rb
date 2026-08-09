class Category < ApplicationRecord
  include Meilisearch::Rails
  belongs_to :company

  validates :name, presence: true, uniqueness: true
  default_scope { order(position: :desc) }

  meilisearch do
    attribute :name
    ranking_rules %w[words typo proximity attribute sort exactness]
    searchable_attributes [ :name ]
    filterable_attributes [ :name ]
    sortable_attributes [ :created_at ]
    displayed_attributes [ :id, :name ]
  end
end
