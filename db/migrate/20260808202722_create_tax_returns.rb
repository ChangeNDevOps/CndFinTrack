class CreateTaxReturns < ActiveRecord::Migration[8.1]
  def change
    create_table :tax_returns do |t|
      t.references :company, null: false, foreign_key: true
      t.references :tax_yearly, null: false, foreign_key: true
      t.date :start_at

      t.timestamps
    end
  end
end
