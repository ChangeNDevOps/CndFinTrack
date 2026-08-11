class CreateCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :categories do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.integer :position, default: 0, null: false
      t.integer :status

      t.timestamps
    end
  end
end
