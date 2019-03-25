class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :client_id, foreign_key: true
      # t.timestamps :order_date
      t.boolean :complete

      t.timestamps
    end
  end
end
