class TaxReturnExpense < ApplicationRecord
  belongs_to :tax_return
  belongs_to :expense
end
