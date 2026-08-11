class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.decimal :unit_price, precision: 10, scale: 2
      t.integer :category_price
      t.integer :status

      t.timestamps
    end
  end
end
