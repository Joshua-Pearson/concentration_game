class GamesController < ApplicationController

  def welcome

  end

  def new_game
    @game = Game.find_by(id: params[:id])
    @game.turn = 0
    @game.save
    @cards = @game.deck.shuffle
  end

  def turn

  end

private

  def start_new_game

  end

end