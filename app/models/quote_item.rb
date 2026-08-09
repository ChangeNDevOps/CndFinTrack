class QuoteItem < ApplicationRecord
  belongs_to :quote
  belongs_to :product
  validates :quantity, presence: true
  attr_accessor :total, :unit_price
  after_commit :touch_quote

  def total
    return nil unless product
    product&.unit_price * quantity
  end

  def touch_quote
    quote&.index!
  end
end
