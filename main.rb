board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
winning_combos = [board[0], board[1], board[2]],
                  [board[3], board[4], board[5]],
                  [board[6], board[7], board[8]],
                  [board[0], board[3], board[6]],
                  [board[1], board[4], board[7]],
                  [board[2], board[5], board[8]],
                  [board[2], board[4], board[6]],
                  [board[0], board[4], board[8]]

def display_board(board)
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts "--+---+--"
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts "--+---+--"
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
end

def play_game(board)
  puts "Player 1 starts. Choose a square."
  input = gets.chomp.to_i
  puts "\n"
  
  if input.between?(1, 9) && board[input - 1] != "X" && board[input - 1] != "O" && board[input - 1] != 0
    board[input-1] = "X"
  else
    puts "Invalid input. Please try again"

  end
  display_board(board)

  puts "\nPlayer 2 goes next. Choose a square."
  input2 = gets.chomp.to_i
  puts "\n"

  if input2.between?(1, 9) && board[input2 - 1] != "X" && board[input - 1] != "O" && board[input2 - 1] != 0
    board[input2-1] = "O"
  else
    puts "Invalid input. Please try again"
  end
  display_board(board)
end


play_game(board)

# puts winning_combinations

