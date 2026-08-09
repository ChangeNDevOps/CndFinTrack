class CreateTaxReturnPayments < ActiveRecord::Migration[8.1]
  def change
    create_table :tax_return_payments do |t|
      t.references :tax_return, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
