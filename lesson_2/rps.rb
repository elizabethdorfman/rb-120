class Move
  VALUES = ['rock', 'paper', 'scissors']
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    case @value
    when rock?
      return true if other_move.scissors?
    when paper?
      return true if other_move.rock?
    when 'scissors'
      return true if other_move.paper?
    end
    false
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (scissors? && other_move.rock?) ||
      (paper? && other_move.scissors)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper or scissors:"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', "Chappie", 'Sonny', "Number 5"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
		@score = [0,0]
  end

  def display_welcome_message
    puts "Welcome."
  end

  def display_goodbye_message
    puts "Bye thanks for playing."
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  # case human.move
  # when 'rock'
  # 	puts "It's a tie" if computer.move == 'rock'
  # 	puts "#{human.name} won!" if computer.move == 'scissors'
  # 	puts "#{computer.name} won!" if computer.move == 'paper'

  # when 'paper'
  # 	puts "It's a tie" if computer.move == 'paper'
  # 	puts "#{human.name} won!" if computer.move == 'rock'
  # 	puts "#{computer.name} won!" if computer.move == 'scissors'
  # when 'scissors'
  # 	puts "It's a tie" if computer.move == 'scissors'
  # 	puts "#{human.name} won!" if computer.move == 'paper'
  # 	puts "#{computer.name} won!" if computer.move == 'rock'
  # end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
    false
  end

	def score

	end
  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
