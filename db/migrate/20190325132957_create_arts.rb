class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.integer :artist_id, foreign_key: true
      t.string :title
      t.string :descrption
      t.float :price
      t.datetime :est_date
      t.string :img_url

      t.timestamps
    end
  end
end
