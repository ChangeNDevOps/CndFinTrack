class Customer < ApplicationRecord
  include Archivable
  include Meilisearch::Rails
  belongs_to :company
  validates :name, presence: true
  validates :country_code, presence: true
  validates :province_code, presence: true
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :quotes, dependent: :destroy
  has_many :invoices, through: :quotes
  after_create :set_prefix

  def address
    result = []
    result << address1 if address1.present?
    result << address2 if address2.present?
    result << city if city.present?
    result << zip if zip.present?
    result << province if province.present?
    result << country if country.present?
    result.join(', ')
  end

  def country
    country = Carmen::Country.coded(country_code)
    country.name
  end

  def province
    country = Carmen::Country.coded(country_code)
    province = country.subregions.coded(province_code)
    province.name
  end

  def set_prefix
    base_prefix = "#{name.first(3)}#{country_code}#{province_code}".upcase
    count = company.customers.where('prefix LIKE ?', "#{base_prefix}%").count
    initial_prefix = "#{base_prefix}#{"%02d" % count}"
    self.update(prefix: initial_prefix)
  end

  meilisearch do
    attribute :name

    searchable_attributes [ :name ]
    filterable_attributes [ :name ]
    sortable_attributes [ :created_at ]
  end
end
