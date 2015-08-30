class Game < ActiveRecord::Base

  has_one :deck
  has_one :player
  has_many :cards, through: :deck

end
