WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]}  "
  puts "------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]}  "
  puts "------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]}  "
end

def input_to_index(user_input)
 user_input.to_i - 1
end

def valid_move?(board, index)
  index.between?(0,8) && board[index] == " "
end

def move(board, index, token)
  board[index] = token
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |set|
    return set if board[set[0]] == board[set[1]] && 
    board[set[1]] == board[set[2]] && 
    board[set[0]] != " "
  end
  false
end

def full?(board)
  board.none? {|el| el == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  return true if draw?(board)
  won?(board)
end

def winner(board)
  symbol = won?(board)
  return nil unless symbol
  board[symbol.first]
end

def turn_count(board_array)
  counter = 0
  board_array.each {|el| counter +=1 if el != " "}
  counter
end

def current_player(board_array)
  if turn_count(board_array).even?
    "X"
  else
    "O"
  end
end

def turn(board, index, token)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index, token)
    move(board, index, token)
    display_board(board)
  else
    turn(board, index, token)
  end
end

def play(board)
  until over?(board)
  turn(board)
  end
end
