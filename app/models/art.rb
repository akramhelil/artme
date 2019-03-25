class Art < ApplicationRecord
  has_many :ordered_arts

  belongs_to :artist

  def artst_name
    self.artist.fullname
  end




  validates :title, :descrption, :price, :est_date, :img_url, presence: true
  validates :title, uniqness: { scope: [:artist_id], message: "The title is already taken."}

end
