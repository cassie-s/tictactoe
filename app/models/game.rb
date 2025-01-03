class Game < ApplicationRecord
  serialize :board, Array

  after_initialize :set_defaults

  def set_defaults
    self.board ||= Array.new(9, " ")
    self.current_player ||= "X"
  end

  def valid_move?(position)
    position.between?(0, 8) && board[position] == " "
  end

  def winner?
    win_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]

    win_combinations.any? do |combo|
      [board[combo[0]], board[combo[1]], board[combo[2]]].uniq.length == 1 &&
        board[combo[0]] != " "
    end
  end

  def full_board?
    !board.include?(" ")
  end
end
