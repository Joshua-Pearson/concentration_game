class Game < ActiveRecord::Base

  has_one :deck
  has_one :player
  has_many :cards, through: :deck

  def reset
    update_attributes(turn: 0)
    player.update_attributes(points: 0)
    deck.set_cards_as_unmatched
  end

end
