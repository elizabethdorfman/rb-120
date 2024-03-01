# frozen_string_literal: true

require 'pry'

# Tic tac toe board
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]} "
    puts '     |     |'
    puts ''
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # def count_human_marker(squares)
  # 	squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  # end

  # def count_computer_marker(squares)
  # 	squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  # end

  def count_marker(marker, squares)
    squares.collect(&:marker).count(marker)
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      TTTGame.markers.each do |counting_marker|
        squares = @squares.select { |k, _v| line.include?(k) }.values
				return counting_marker if count_marker(counting_marker, squares) == 3
      end
    end
    # WINNING_LINES.each do |line|
    # 	if count_human_marker(@squares.select{|k,v| line.include?(k)}.values) == 3
    # 		return TTTGame::HUMAN_MARKER
    # 	elsif count_computer_marker(@squares.select{|k,v| line.include?(k)}.values) == 3
    # 		return TTTGame::COMPUTER_MARKER
    # 	end
    # end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

# Square for tictactoe board
class Square
  attr_accessor :marker

  INITIAL_MARKER = ' '
  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

# Player information for tictactoe ex marker
class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def mark; end

  def win; end
end

# Tictactoe game play
class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer, :humanname, :computername

  def initialize
    @board = Board.new
		@human_marker = pick_marker
		@@markers = [@human_marker, COMPUTER_MARKER]
		@humanname = get_name
		@computername= %w(Angel, Xander, Buffy, Dawn, Glory, Willow, Giles, Wesley).sample
    @human = Player.new(@human_marker)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

	def self.markers
		@@markers
	end
	def get_name
		print "Please enter your name: "
		name = gets.chomp
		name
	end
  def current_player_moves
    if @current_marker == HUMAN_MARKER
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye.'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "#{humanname}, you're a #{human.marker}. Computer, #{computername} is a #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def human_moves
    puts "Choose a square between (#{board.unmarked_keys.join(', ')}): "
    square = ''
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = @human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts 'You won.'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y,n)'
      answer = gets.chomp.downcase
      break if %w[y n].include? answer

      puts 'Sorry, must be y or n'
    end
    return false if answer == 'n'
    return true if answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = HUMAN_MARKER
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?

      clear_screen_and_display_board
    end
  end
	def pick_marker
		answer = nil
		loop do
      print 'Pick a one character marker: '
      answer = gets.chomp
      break if answer.length == 1
      puts 'Sorry, not one character.'
    end
		answer
	end
  def main_game
    loop do
      display_board
      player_move
      display_result
      break unless play_again?

      reset
      display_play_again_message
    end
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
