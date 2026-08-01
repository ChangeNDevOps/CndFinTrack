class TaxReturnPayment < ApplicationRecord
  belongs_to :tax_return
  belongs_to :payment
end
