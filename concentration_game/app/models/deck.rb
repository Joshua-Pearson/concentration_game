class Deck < ActiveRecord::Base
  belongs_to :game
  has_many :cards

  def shuffle
    cards.where(matched: false).shuffle
  end

  def set_cards_as_unmatched
    cards.all.each do |card|
      card.matched = false
      card.save
    end
  end

end
