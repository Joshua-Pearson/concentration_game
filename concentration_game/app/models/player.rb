class Player < ActiveRecord::Base
  belongs_to :game

  validates_presence_of :name, :game_id, allow_blank: false
end
