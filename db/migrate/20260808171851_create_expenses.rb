class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.references :company, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.boolean :taxable, default: true
      t.date :invoiced_on
      t.date :paid_on

      t.timestamps
    end
  end
end
