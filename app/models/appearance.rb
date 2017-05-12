class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  belongs_to :user
  validates_inclusion_of :rating, :in => 0..99

end
