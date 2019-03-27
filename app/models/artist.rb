class Artist < ApplicationRecord
  has_many :arts
  has_many :ordered_arts, through: :arts
  include BCrypt

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  before_validation :make_capitalized


  def is_capitalized
    if first_name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:first_name, " must be capitalized")
      if last_name.split.any?{|w|w[0].upcase != w[0]}
        errors.add(:last_name, " must be capitalized")
      end
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
