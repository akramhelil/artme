class Artist < ApplicationRecord
  has_many :arts
  validates :first_name, :last_name, :email, presence: true

  def fullname
    self.first_name + " " + self.last_name
  end

end
