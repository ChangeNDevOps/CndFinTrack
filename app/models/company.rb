class Company < ApplicationRecord
  TPS_TAX = 0.05
  TVQ_TAX = 0.09975
  ALL_TAX =  1.14975
  include Archivable
  belongs_to :team
  has_many :customers
  has_many :categories
  has_many :tags
  has_many :suppliers
  has_many :expenses
  has_many :products
  has_many :tax_yearlies
  has_many :tax_returns, through: :tax_yearlies
  has_many :tax_return_expenses, through: :tax_returns
  has_many :tax_return_payments, through: :tax_returns
  has_many :quotes
  has_many :quote_items, through: :quotes
  has_many :invoices, through: :quotes
  has_many :payments, through: :invoices
end
