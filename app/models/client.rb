class Client < ApplicationRecord
  has_many :ordered_arts

  has_secure_password

  has_many :arts, through: :ordered_arts


  validates :first_name, :last_name, :email, :address, presence: true
  validates :email, uniqueness: true

  before_validation :make_capitalized

  def is_capitalized
    if first_name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:first_name, " must be capitalized")
    end
    if last_name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:last_name, " must be capitalized")
    end
  end

  def make_capitalized
    self.first_name = self.first_name.titlecase
    self.last_name = self.last_name.titlecase
  end


  def fullname
    self.first_name + " " + self.last_name
  end

  def my_art
    self.ordered_arts.map {|a| a.art}
  end
  # my_art.map {|a| a.artist.fullname}
  # inject(Hash.new(0)) { |h,v| h[v] += 1; h }

  def date
    self.created_at.strftime('%a, %B %d, %Y')
  end


end
