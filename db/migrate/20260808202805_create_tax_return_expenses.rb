class CreateTaxReturnExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :tax_return_expenses do |t|
      t.references :tax_return, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
