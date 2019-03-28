class Art < ApplicationRecord
  has_many :ordered_arts
  has_many :clients, through: :ordered_arts
  belongs_to :artist


  validates :title, :descrption, :price, :est_date, :img_url, presence: true
  validates :title, uniqueness: { scope: [:artist_id], message: "The title is already taken."}


  def artst_name
    self.artist.fullname
  end


  def self.search(word)
    if word
      word_upcase = word.capitalize
      art = Art.find_by(title: word_upcase)
      artist = Artist.find_by(first_name: word_upcase)
          if art
            self.where(art_id: art)
          else
            Art.all
          end
          if artist
            Art.where(artist_id: artist)
          else
            Art.all
          end
      else
        Art.all
    end
  end


end
