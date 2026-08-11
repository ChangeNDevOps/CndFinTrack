class CreateTaxYearlies < ActiveRecord::Migration[8.1]
  def change
    create_table :tax_yearlies do |t|
      t.references :company, null: false, foreign_key: true
      t.date :start_at
      t.integer :tax_return_duration_in_month
      t.decimal :tps_rate, precision: 10, scale: 8
      t.decimal :tvq_rate, precision: 10, scale: 8

      t.timestamps
    end
  end
end
