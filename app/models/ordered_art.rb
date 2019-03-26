class OrderedArt < ApplicationRecord
  belongs_to :art
  belongs_to :order

end
