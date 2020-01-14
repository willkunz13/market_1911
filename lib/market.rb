class Market

	attr_reader :name, :vendors

	def initialize(name)
		@name = name
		@vendors = []
	end

	def add_vendor(vendor)
		if vendors.include?(vendor)
			return
		else
			vendors << vendor
		end
	end

	def vendor_names
		vendors.map {|vendor| vendor.name}
	end

	def vendors_that_sell(item)
		vendors.find_all {|vendor| vendor.inventory.keys.include?(item)}
	end

	def sorted_item_list
		items = []
		vendors.each {|vendor| items << vendor.inventory.keys}
		item_names = items.flatten.map {|item| item.name}
		item_names.uniq.sort
	end

	def total_inventory
		all_item_hashes = vendors.map {|vendor| vendor.inventory}
		totals = all_item_hashes.reduce({}) do |sums, items|
  			sums.merge(items) do  |_,old_quantity, new_quantity|
				 old_quantity + new_quantity
			end 
		end
		totals
	end

	def sell(item, quantity)
		if !total_inventory.keys.include?(item)
			return false
		else
			if total_inventory[item] < quantity
				return false
			else
				vendors_sell(item, quantity)
				return true
			end
		end
	end

	def vendors_sell(item, quantity)
		vendors.each do |vendor|
			if vendor.inventory.keys.include?(item)
				if vendor.inventory[item] >= quantity
					vendor.sell(item, quantity)
					quantity = 0
				else
					quantity_holder = quantity
					quantity -= vendor.inventory[item]
					vendor.sell(item, quantity_holder)
					binding.pry
				end
			end
		end
	end
end	
