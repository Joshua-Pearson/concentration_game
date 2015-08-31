class Card < ActiveRecord::Base
  belongs_to :deck

  validates_presence_of :value, :suit, :face, :deck_id, allow_blank: false

  def is_matching?(another_card)
    value == another_card.value ? true : false
  end
end
