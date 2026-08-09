class CreateQuotes < ActiveRecord::Migration[8.1]
  def change
    create_table :quotes do |t|
      t.references :company, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :uuid
      t.string :name
      t.date :available_on
      t.integer :available_duration_in_month
      t.integer :status
      t.date :approved_at
      t.date :rejected_at
      t.timestamps
    end
  end
end
