class Vendor

	attr_reader :inventory, :name

	def initialize(name)
		@name = name
		@inventory = {}
	end

	def check_stock(item)
		if inventory.keys.include?(item)
			inventory[item]
		else
			0
		end
	end

	def stock(item, number)
		if inventory.keys.include?(item)
			inventory[item] += number
		else
			inventory[item] = number
		end
	end
		

end
