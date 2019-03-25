class Client < ApplicationRecord
  has_many :orders
  has_many :ordered_arts, through: :orders
end
