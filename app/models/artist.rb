class Artist < ApplicationRecord
  has_many :arts
  has_many :ordered_arts, through: :arts
  has_secure_password

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

  def start_date
    self.created_at.strftime('%B %Y')
  end



  def popular_art
    arr = self.ordered_arts.map {|a| a.art.title}
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    freq.sort_by{|k,v| v}.reverse[0..4]
  end

  def today_order
    self.ordered_arts.select {|a| a.created_at.localtime.day == Date.today.day && a.created_at.localtime.month == Date.today.month && a.created_at.localtime.year == Date.today.year}
  end

end
