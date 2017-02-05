class Game
	attr_accessor :player_symbol, :a

	def initialize
		@player_symbol = "X"
		@a = [1,2,3,4,5,6,7,8,9]
	end

	def update_board 
		puts "_____________"
		puts "| #{@a[0]} | #{@a[1]} | #{@a[2]} |"
		puts "_____________"
		puts "| #{@a[3]} | #{@a[4]} | #{@a[5]} |"
		puts "_____________"
		puts "| #{@a[6]} | #{@a[7]} | #{@a[8]} |"
		puts "_____________"

		#Alternate View
		#puts "[#{@a[0]}][#{@a[1]}][#{@a[2]}]"
		#puts "[#{@a[3]}][#{@a[4]}][#{@a[5]}]"
		#puts "[#{@a[6]}][#{@a[7]}][#{@a[8]}]"
	end

	def turn
		puts "#{@player_symbol}'s Turn!"
		loop do
			puts "Type the number of a square on the board!"
			@square = gets.downcase.chomp
			break if @square == "q" || valid_move
		end
		if @square == "q"
			puts "Thanks for playing!"
			exit
		end
		i = @square.to_i-1
		@a[i] = @player_symbol
		update_board
	end

	def switch
		if @player_symbol == "X"
			@player_symbol = "O"
		else
			@player_symbol = "X"
		end
	end

	def game_won?
		winning_array = [
			[0, 1, 2],
			[3, 4, 5],
			[6, 7, 8],
			[0, 3, 6],
			[1, 4, 7],
			[2, 5, 8],
			[0, 4, 8],
			[2, 4, 6] ]

			return winning_array.any?{|set| set.all?{|index| @a[index]==@player_symbol} }

	end

	def draw?
		if @a.all?{|square| square == "X" || square =="O"}
			@player_symbol = "D"
			true
		end
		false
	end

	def game_over
		if @player_symbol == "D"
			puts "It was a draw!"
		else
			puts "#{@player_symbol} won!"
		end
	end

	def valid_move 
		@square = @square.to_i
		return true if @a.include?(@square)
	end

	def play_again?
		choice = false
		loop do
			puts "Would you like to play tic-tac-toe again? Type y or n."
			choice = gets.chomp
			break if choice =="y" || choice == "n"
		end

		if choice == "y"
			true
		else
			false
		end
	end

	def play
		puts "Let's play tic-tac-toe! The choices are square 1-9"
		#new_board
		update_board
		loop do 
			turn
			if game_won? == true || draw? ==true
				game_over
				if play_again? == true
					play
				else
					exit
				end
			end
			switch
		end
	end

end

#g = Game.new.play