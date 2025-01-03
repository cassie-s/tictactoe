class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    position = params[:position].to_i
    if @game.valid_move?(position)
      @game.board[position] = @game.current_player
      @game.current_player = @game.current_player == "X" ? "O" : "X"
      @game.save
    end
    redirect_to @game
  end

  private

  def game_params
    params.require(:game).permit(:board, :current_player)
  end
end
