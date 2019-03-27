class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :location
      t.text :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
