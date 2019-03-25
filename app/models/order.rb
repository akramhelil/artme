class Order < ApplicationRecord
  belongs_to :client
  has_many :ordered_arts
end
