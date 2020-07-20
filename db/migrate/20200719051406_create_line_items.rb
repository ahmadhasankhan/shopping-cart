class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :product_id, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :price

      t.timestamps
    end
  end
end
