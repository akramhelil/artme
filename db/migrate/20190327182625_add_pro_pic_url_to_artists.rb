class AddProPicUrlToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :pro_pic_url, :string
  end
end
