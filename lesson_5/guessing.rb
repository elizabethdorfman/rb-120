class GuessingGame
	attr_accessor :guesses
def initialize(num1, num2)
	@num = rand(num1..num2)
	@min = num1
	@max = num2
	@size_of_range = (num1-num2).abs
	@guesses = Math.log2(@size_of_range).to_i + 1
end
def play
	guess = nil
	loop do
		break if guesses == 0 || win?(guess)
		puts "You have #{@guesses} guesses remaining."
		print "Enter a number between #{@min} and #{@max}: "
		guess= gets.chomp.to_i
		next if !valid?(guess)
		high?(guess)
		@guesses -= 1
		win if win?(guess)
		lost if guesses == 0
	end
end
private
def win?(guess)
	@num == guess
end
def high?(guess)
	if guess > @num
		puts "Your guess is too high."
	elsif guess < @num
		puts "Your guess is too low."
	end
end
def valid?(guess)
	if guess >=  100 || guess <1
		puts "Invalid guess."
		false
	end
	true
end
def win
	puts "That's the number!"
	puts "You won!"
end
def lost
	puts "You have no more guesses. You lost!"
end
end


game = GuessingGame.new(1,3000)
game.play
