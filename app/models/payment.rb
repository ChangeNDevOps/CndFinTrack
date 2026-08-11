class Payment < ApplicationRecord
  include Meilisearch::Rails
  belongs_to :invoice
  after_create :set_uuid

  def name
    uuid
  end

  def customer
    invoice.quote.customer
  end

  def quote
    invoice.quote
  end

  def set_uuid
    base_uuid = "P#{quote.uuid}".upcase
    count = company.payments.where('payments.uuid LIKE ?', "#{base_uuid}%").count
    self.update(uuid: "#{base_uuid}#{"%02d" % count}")
  end

  meilisearch do
    attribute :id, :invoice_id

    add_attribute :customer_name do
      customer&.name
    end

    searchable_attributes [ :customer_name ]
    filterable_attributes [ :created_at, :invoice_id ]
    sortable_attributes [ :created_at ]
  end
end
