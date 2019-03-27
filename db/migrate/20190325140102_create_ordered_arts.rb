class CreateOrderedArts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_arts do |t|
      t.integer :art_id, foreign_key: true
      t.integer :client_id, foreign_key: true

      t.timestamps
    end
  end
end
