class Client < ApplicationRecord
  has_many :orders
  has_many :ordered_arts, through: :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :address, presence: true

  before_validation :make_capitalized

  def is_capitalized
    if name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:name, " must be capitalized")
    end
  end

  def make_capitalized
    self.first_name = self.first_name.titlecase
    self.last_name = self.last_name.titlecase
  end



  def fullname
    self.first_name + " " + self.last_name
  end

end
