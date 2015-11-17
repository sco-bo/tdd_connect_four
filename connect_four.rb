class Player
  attr_accessor :color
  def initialize(color)
    @color = color
  end
end

class Board
  attr_accessor :spaces
  def initialize
    @spaces = Array.new(42)
  end

  def to_s
    output = ""
    0.upto(41) do |position|
      output << "#{@spaces[position] || position}".rjust(2, '0')
      case position % 7
      when 0, 1, 2, 3, 4, 5 then output << " | "
      when 6 then output << "\n---------------------------------\n" unless position == 41
      end
    end
    output
  end

  def space_free?(position)
    @spaces[position].nil?
  end

  def place_piece(cell, color)
    top_position = 
      @spaces.each_index.select do |i|
        i % 7 == cell && @spaces[i].nil?
      end.max
    @spaces[top_position] = color
  end

  def winner

  end

  def tie?
    return !@spaces.include?(nil) && !winner
  end
end

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Black")
    @player2 = Player.new("Red")
    @current_turn = 1
  end

  def play_game
    puts @board
    while !@board.winner && !@board.tie?
      move(current_player)
      puts @board
    end
    print_game_result
  end

  # private

  def move(player)
    puts "In which column would you like to drop your piece 'player #{player.color}'?"
    choice = gets.chomp.to_i
    if @board.space_free?(choice)
      @board.place_piece(choice, player.color)
      @current_turn += 1
      puts "Player #{player.color}'s move:"
    else
      puts "Column unavailable! Please select another column"
    end
  end

  def print_game_result
    if @board.winner
      @current_turn += 1
      puts "Player #{current_player.color} wins!"
      puts "Game over"
    else
      puts "It's a draw"
    end
  end

  def current_player 
    @current_turn.even? ? @player2 : @player1
  end
end

def play_again?
  puts "Play again? (yes or no)"
  answer = gets.chomp.downcase
  return answer == "yes"
end

loop do 
  Game.new.play_game
  unless play_again?
    puts "Goodbye"
    break
  end
end









