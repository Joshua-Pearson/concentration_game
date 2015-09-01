class Card < ActiveRecord::Base
  belongs_to :deck
  validates_presence_of :value, :suit, :face, :deck_id, allow_blank: false

  p = ["11", "12", "13", "14", "15", "21", "22", "23", "24", "25", "31", "32", "33", "34", "35"]

  CSS_VALUE_MATCHING = {
    2 => [p[5], p[9]], 3 => [p[5], p[9], p[7]], 4 => [p[0], p[4], p[10], p[14]], 5 => [p[0], p[4], p[10], p[14], p[7]],
    6 => [p[0], p[2], p[4], p[10], p[12], p[14]], 7 => [p[0], p[2], p[4], p[10], p[12], p[14], p[6]], 8 => [p[0], p[2], p[4], p[10], p[12], p[14], p[6], p[8]],
    9 => [p[0], p[1], p[3], p[4], p[14], p[13], p[11], p[10], p[7]], 10 => [p[0], p[1], p[3], p[4], p[14], p[13], p[11], p[10], p[8], p[6]]
}

  def is_matching?(another_card)
    value == another_card.value ? true : false
  end
end
