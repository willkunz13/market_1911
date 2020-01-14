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
			
end
