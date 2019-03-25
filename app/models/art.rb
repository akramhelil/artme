class Art < ApplicationRecord
  belongs_to :artist
  has_many :ordered_arts
end
