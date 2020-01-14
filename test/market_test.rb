require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/item.rb'
require_relative '../lib/vendor.rb'
require_relative '../lib/market.rb'

class MarketTest < Minitest::Test

	def setup
		@market = Market.new("South Pearl Street Farmers Market")
		@item1 = Item.new({name: 'Peach', price: "$0.75"})
		@item2 = Item.new({name: 'Tomato', price: '$0.50'})
		@item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
		@item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
		@vendor1 = Vendor.new("Rocky Mountain Fresh")
		@vendor1.stock(@item1, 35)
		@vendor1.stock(@item2, 7)
		@vendor2 = Vendor.new("Ba-Nom-a-Nom")
		@vendor2.stock(@item4, 50)
		@vendor2.stock(@item3, 25)	
		@vendor3 = Vendor.new("Palisade Peach Shack")
		@vendor3.stock(@item1, 65)
	end

	def test_it_exists
		assert_instance_of Market, @market
	end

	def test_its_variables
		assert_equal "South Pearl Street Farmers Market", @market.name
		assert_equal [], @market.vendors
	end
end