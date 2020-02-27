$grand_total=0
class Shopping
	def initialize
		print "Enter your name:"
		@@name=gets
		print "=========================Welcome=========================\n"
		@tv=10000
		@wash_machine=15000
		@ac=1500
		@shirt=1000
		@jeans=2000
		@tshirt=500
		@sofa=25000
		@bed=30000
		@table=15000
		@@total_electronics=0
		@@total_clothing=0
		@@total_furniture=0
		@bill=Array.new()
		@i=0
	end
	def category
		print "\n1.electronics \n2.clothing \n3.Furniture \nSelect a categoty:"
		@category=gets.chomp.to_i
		case @category
		when 1
			diplay_electronics
		when 2
			display_clothing
		when 3
			display_furniture
		else
			print "Invalid input!"
		end		
	end
	def select_choice
		print "\nEnter your choice:"
		@choice=gets.chomp.to_i
	end
	def select_quantity
		print "Enter Quantity:"
		@quantity=gets.chomp.to_i
	end
	def total_bill
		$grand_total=@@total_electronics+@@total_clothing+@@total_furniture
		print "Your Total Bill is #$grand_total\n"
	end
	def shop_continue
		print "Want to Continue shopping?(y/n)"
		@shop=gets.chomp
		if(@shop=='y')
			category
		elsif(@shop=='n')
		print "\nThank You for shopping #@@name\n"
		print "=========================Invoice=========================\n"
		print "Category \t Item \t\t Price \t Quantity\n"
				@bill.each do |product|
					puts "#{product[:Category]} \t #{product[:Item]} \t\t #{product[:Price]} \t #{product[:Quantity]}"
				end	
				total_bill
		else
			print "Invalid Input!\n"
		end
	end
	def diplay_electronics
		puts "\nElectronics items are:\n"
		puts "1.Tv price:#@tv"
		puts "2.Washing Machine price:#@wash_machine"
		puts "3.Air Conditioner price:#@ac"
		@choice=select_choice.to_i
		@quantity=select_quantity
		case @choice
		when 1
			@@total_electronics=(@tv*@quantity)+@@total_electronics
			electronics_hash = {:Category => "Electronics",:Item => "TV", :Price => "#{@tv}", :Quantity => @quantity}
			
		when 2
			@@total_electronics=(@wash_machine*@quantity)+@@total_electronics
			electronics_hash = {:Category => "Electronics",:Item => "Wash Machine", :Price =>"#{@wash_machine}" , :Quantity => @quantity}
		when 3
			@@total_electronics=(@ac*@quantity)+@@total_electronics
			electronics_hash = {:Category => "Electronics",:Item => "AC", :Price => "#{@ac}", :Quantity => @quantity}	
		else
			print "Invalid Choice"
		end	
		@bill.each do |items|
			if electronics_hash[:Item]	== items[:Item]
				electronics_hash[:Quantity]=electronics_hash[:Quantity]+items[:Quantity]
				@bill.delete(items)
			end
		end 
		@bill.push(electronics_hash)
		print "\nTotal Bill of electronics is #@@total_electronics\n"
		shop_continue
	end		
	def display_clothing
		puts "\nClothings item are:\n"
		puts "1.Shirt price:#@shirt"
		puts "2.Jeans price:#@jeans"
		puts "3.Tshirt price:#@tshirt"
		@choice=select_choice.to_i
		@quantity=select_quantity
		case @choice
		when 1
			@@total_clothing=(@shirt*@quantity)+@@total_clothing
			clothing_hash = {:Category => "Clothing",:Item => "Shirt", :Price => @shirt, :Quantity => @quantity}	
		when 2
			@@total_clothing=(@jeans*@quantity)+@@total_clothing
			clothing_hash = {:Category => "Clothing",:Item => "Jeans", :Price => @jeans, :Quantity => @quantity}	
		when 3
			@@total_clothing=(@tshirt*@quantity)+@@total_clothing
			clothing_hash = {:Category => "Clothing",:Item => "t-Shirt", :Price => @tshirt, :Quantity => @quantity}	
		else
			print "Invalid Choice"
		end
		@bill.each do |items|
			if clothing_hash[:Item]	== items[:Item]
				clothing_hash[:Quantity]=clothing_hash[:Quantity]+items[:Quantity]
				@bill.delete(items)
			end
		end 
		@bill.push(clothing_hash)
		print "Total Bill of Clothing is #@@total_clothing\n"
		shop_continue
	end

	def display_furniture
		puts "\nFurniture items are:\n"
		puts "1.Sofa price:#@sofa"
		puts "2.Bed price:#@bed"
		puts "3.Table price:#@table"
		@choice=select_choice.to_i
		@quantity=select_quantity
		case @choice
		when 1
			@@total_furniture=(@sofa*@quantity)+@@total_furniture
			furniture_hash = {:Category => "Firniture",:Item => "Sofa", :Price => @sofa, :Quantity => @quantity}	
		when 2
			@@total_furniture=(@bed*@quantity)+@@total_furniture
			furniture_hash = {:Category => "Firniture",:Item => "Bed", :Price => @bed, :Quantity => @quantity}	
		when 3
			@@total_furniture=(@table*@quantity)+@@total_furniture
			furniture_hash = {:Category => "Furniture",:Item => "Table", :Price => @table, :Quantity => @quantity}	
		else
			print "Invalid Choice"
		end
		@bill.each do |items|
			if furniture_hash[:Item]	== items[:Item]
				furniture_hash[:Quantity]=furniture_hash[:Quantity]+items[:Quantity]
				@bill.delete(items)
			end
		end 
		@bill.push(furniture_hash)
		print "Total Bill of furniture #@@total_furniture\n"
		shop_continue
	end
end
s1=Shopping.new
s1.category