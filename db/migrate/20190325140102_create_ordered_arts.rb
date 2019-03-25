class CreateOrderedArts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_arts do |t|
      t.integer :order_id, foreign_key: true
      t.integer :art_id, foreign_key: true

      t.timestamps
    end
  end
end
