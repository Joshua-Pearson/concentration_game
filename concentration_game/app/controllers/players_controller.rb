class PlayersController < ApplicationController

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to game_path(@player.game)
    else
      flash.now[:alert] = "#{@player.errors.full_messages.to_sentence}"
    end
  end

private

  def player_params
    params.require(:player).permit(:name, :game_id, :points)
  end

end