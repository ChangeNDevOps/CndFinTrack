class Company < ApplicationRecord
  belongs_to :team
  has_many :customers
  has_many :categories
  has_many :tags
  has_many :suppliers
  has_many :expenses
  has_many :products
  has_many :tax_return
  has_many :tax_return_expenses, through: :tax_return
  has_many :tax_return_payments, through: :tax_return
  has_many :quotes
  has_many :quote_items, through: :quotes
  has_many :invoices, through: :quotes
  has_many :payments, through: :invoices
end
