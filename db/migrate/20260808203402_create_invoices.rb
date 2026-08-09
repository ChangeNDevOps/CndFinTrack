class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.references :quote, null: false, foreign_key: true
      t.string :uuid
      t.date :invoiced_on
      t.date :due_on
      t.boolean :taxable, default: true

      t.timestamps
    end
  end
end
