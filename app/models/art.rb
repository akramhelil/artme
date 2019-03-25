class Art < ApplicationRecord
  belongs_to :artist
  has_many :ordered_arts

  validates :title, :descrption, :price, :est_date, :img_url, presence: true
  validates :title, uniqness: { scope: [:artist_id], message: "The title is already taken."}
end
