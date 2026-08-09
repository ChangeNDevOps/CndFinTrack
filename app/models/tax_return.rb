class TaxReturn < ApplicationRecord
  belongs_to :company
  belongs_to :tax_yearly
  has_many :tax_return_expenses, dependent: :destroy
  has_many :tax_return_payments, dependent: :destroy
end
