class Number_guess 
	def initialize
		puts "------------------------------WELCOME TO THE GAME------------------------------"
		@random_number=rand(50..150)
		#puts "Random number is:#{@random_no}"
		check_number(@random_no)
	end
	def check_number
		(1..10).each do |i|
			print "\nGuess the Number between 50 to 150 :"
			user_number=gets.to_i
			if user_number == @random_number
				puts "\nCongratulations, You got the number #{@random_number} in #{i} attempts..!"
				break
			elsif user_number < @random_number
				puts "You have entered lesser number..!"
				next
			elsif user_number > @random_number
				puts "you have entered greater number..!"
				next
			else
				puts "\nSorry..! you lost the game..!"
			end
		end
		
	end
end
n1=Number_guess.new
n1.check_number
