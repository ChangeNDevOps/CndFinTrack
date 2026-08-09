class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :uuid
      t.decimal :amount, precision: 10, scale: 2
      t.date :paid_on

      t.timestamps
    end
  end
end
