class Expense < ApplicationRecord
  include Meilisearch::Rails
  belongs_to :company
  belongs_to :supplier
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :tax_return_expenses, dependent: :destroy

  meilisearch do
    attribute :name

    searchable_attributes [ :name ]
    filterable_attributes [ :name ]
    sortable_attributes [ :created_at ]
  end
end
