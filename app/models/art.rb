class Art < ApplicationRecord
  has_many :ordered_arts
  belongs_to :artist

  def artst_name
    self.artist.fullname
  end



end
