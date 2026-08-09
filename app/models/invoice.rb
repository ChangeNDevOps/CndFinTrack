class Invoice < ApplicationRecord
  include Meilisearch::Rails
  belongs_to :quote
  has_one :payment, dependent: :destroy
  has_many :tax_return_payments, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :quote_items, as: :allocatable
  scope :not_due, -> { where('due_on > ?', Time.zone.today) }
  scope :due,     -> { where('due_on <= ?', Time.zone.today) }
  after_create :set_uuid

  def calc_total_ht
    quote.calc_total_ht
  end

  def company
    quote.customer.company
  end

  def customer
    quote.customer
  end

  def quote_items
    quote.quote_items
  end

  def set_uuid
    base_uuid = "I#{quote.uuid}".upcase
    count = company.invoices.where('invoices.uuid LIKE ?', "#{base_uuid}%").count
    self.update(uuid: "#{base_uuid}#{"%02d" % count}")
  end

  meilisearch do
    attribute :id, :quote_id

    add_attribute :customer_name do
      customer&.name
    end

    add_attribute :product_names do
      quote_items.map { |item| item.product&.name }.compact
    end

    searchable_attributes [ :customer_name, :product_names ]
    filterable_attributes [ :created_at, :quote_id ]
    sortable_attributes [ :created_at ]
  end
end
