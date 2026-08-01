class Quote < ApplicationRecord
  include Meilisearch::Rails
  include Archivable
  belongs_to :company
  belongs_to :customer
  has_many :quote_items, dependent: :destroy
  has_one :invoice, dependent: :destroy
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :quote_items, allow_destroy: true, reject_if: :all_blank
  attr_accessor :total_ht, :total_tvq, :total_tps, :total
  after_create :set_uuid

  def calc_total_ht
    quote_items.sum { |item| item.total || 0 }
  end

  def approved?
    approved_at.present?
  end

  def rejected?
    rejected_at.present?
  end

  def set_uuid
    base_uuid = "Q#{customer.prefix}-#{Time.zone.now.strftime('%Y%m%d')}".upcase
    count = company.quotes.where('uuid LIKE ?', "#{base_uuid}%").count
    self.update(uuid: "#{base_uuid}#{"%02d" % count}")
  end

  meilisearch do
    attribute :id, :name, :status, :calc_total_ht, :customer_id

    add_attribute :customer_name do
      customer&.name
    end

    add_attribute :product_names do
      quote_items.map { |item| item.product&.name }.compact
    end

    searchable_attributes [ :name, :customer_name, :product_names, :status ]
    filterable_attributes [ :status, :created_at, :customer_id ]
    sortable_attributes [ :created_at ]
  end

  def self.approved
    where.not(approved_at: nil)
  end

  def self.rejected
    where.not(rejected_at: nil)
  end
end
