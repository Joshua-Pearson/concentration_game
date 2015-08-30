class Deck < ActiveRecord::Base
  belongs_to :game
  has_many :cards

  def shuffle
    cards.shuffle
  end

end
