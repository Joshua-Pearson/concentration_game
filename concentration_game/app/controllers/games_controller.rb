class GamesController < ApplicationController
  before_action :get_game_and_player, only: [:show, :turn]
  before_action :start_new_game, only: [:show]
  before_action :set_variables_for_each_turn, only: [:turn]

  def welcome

  end

  def create
    @game = Game.new(games_params)
    if @game.save
      @game.deck = Deck.first
    end
  end

  def show

  end

  def turn
    if @card_one.is_matching?(@card_two)
      @card_one.matched = true
      @card_one.save
      @card_two.matched = true
      @card_two.save
      @player.points += 1
      @player.save
      @new_cards = @cards_left.shift(2)
    else
      @player.points -= 1
      @player.save
    end

    respond_to do |format|
      format.js
    end
  end

private

  def get_game_and_player
    @game = Game.find_by(id: params[:id])
    @player = @game.player
  end

  def start_new_game
    @game.deck.set_cards_as_unmatched
    @cards_left = @game.deck.shuffle
    @cards_on_board = @cards_left.shift(22)
  end

  def set_variables_for_each_turn
    @cards_left ||= Card.where(id: params[:cards_left].split(" ")).shuffle
    @game.turn += 1
    @game.save
    @card_one = Card.find_by(id: params[:card_one_id])
    @card_two = Card.find_by(id: params[:card_two_id])
  end

  def games_params
    params.require(:game).permit(:name, :turn)
  end

end