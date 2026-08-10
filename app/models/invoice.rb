class Invoice < ApplicationRecord
  include Meilisearch::Rails
  belongs_to :quote
  has_many :tax_return_payments, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :quote_items, as: :allocatable
  has_many :payments
  scope :not_due, -> { where('due_on > ?', Time.zone.today) }
  scope :due,     -> { where('due_on <= ?', Time.zone.today) }
  after_create :set_uuid

  def name
    uuid
  end

  def calc_total_ht
    quote.calc_total_ht.round(2)
  end

  def calc_total_tps
    (quote.calc_total_ht * Company::TPS_TAX).round(2)
  end

  def calc_total_tvq
    (quote.calc_total_ht * Company::TVQ_TAX).round(2)
  end

  def calc_total_tax
    (quote.calc_total_ht * Company::ALL_TAX).round(2)
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

  def amount_paid
    payments.sum(:amount).round(2)
  end

  def amount_unpaid
    calc_total_tax.round(2) - amount_paid
  end

  def paid?
    amount_unpaid == 0
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
