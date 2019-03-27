class OrderedArt < ApplicationRecord
  belongs_to :art
  belongs_to :client
end
