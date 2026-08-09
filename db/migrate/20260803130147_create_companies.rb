class CreateCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :companies do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name
      t.string :tps_id
      t.string :tvq_id
      t.string :address1
      t.string :address2
      t.string :zip
      t.string :country_code
      t.string :province_code
      t.string :city
      t.string :prefix
      t.integer :status

      t.timestamps
    end
  end
end
