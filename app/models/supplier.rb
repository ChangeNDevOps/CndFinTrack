class Supplier < ApplicationRecord
  include Archivable
  include Meilisearch::Rails
  belongs_to :company
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  def address
    "#{address1}, #{address2}, #{city}, #{zip}, #{province}, #{country}"
  end

  def country
    return '' if country_code.blank?

    country = Carmen::Country.coded(country_code)
    country.name
  end

  def province
    return '' if country_code.blank? || province_code.blank?

    country = Carmen::Country.coded(country_code)
    province = country.subregions.coded(province_code)
    province.name
  end

  meilisearch do
    attribute :name

    searchable_attributes [ :name ]
    filterable_attributes [ :name ]
    sortable_attributes [ :created_at ]
  end
end
