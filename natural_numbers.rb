class Naturalnumber
	def getsum
		print "Enter any natural number:  "
		n=gets.to_i
		sum=0
		(1...n).each do |number|
			if number % 3 == 0 or number % 5 == 0
				#puts number
				sum = sum + number
			end
		end
		puts "the sum of multiples is: #{sum}"
	end
end

obj = Naturalnumber.new
obj.getsum
