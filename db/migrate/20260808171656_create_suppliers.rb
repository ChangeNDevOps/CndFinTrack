class CreateSuppliers < ActiveRecord::Migration[8.1]
  def change
    create_table :suppliers do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :address1
      t.string :address2
      t.string :zip
      t.string :country_code
      t.string :province_code
      t.string :city
      t.string :prefix
      t.integer :status
      t.boolean :taxable

      t.timestamps
    end
  end
end
