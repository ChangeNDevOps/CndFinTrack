class TaxYearly < ApplicationRecord
  belongs_to :company
  has_many :tax_returns, dependent: :destroy
end
