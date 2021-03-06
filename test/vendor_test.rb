require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/item.rb'
require_relative '../lib/vendor.rb'

class VendorTest < Minitest::Test

        def setup
                @item1 = Item.new({name: 'Peach', price: "$0.75"})
                @item2 = Item.new({name: 'Tomato', price: '$0.50'})
                @vendor = Vendor.new("Rocky Mountain Fresh")
        end

        def test_it_exists
                assert_instance_of Vendor, @vendor
        end

        def test_its_variables
		empty_hash = {}
		assert_equal empty_hash, @vendor.inventory
		assert_equal "Rocky Mountain Fresh", @vendor.name
	end

	def test_check_stock
		assert_equal 0, @vendor.check_stock(@item1)
		@vendor.stock(@item1, 30)
		assert_equal 30, @vendor.check_stock(@item1)
		@vendor.stock(@item1, 25)
		assert_equal 55, @vendor.check_stock(@item1)
		@vendor.stock(@item2, 12)
		assert_equal 12, @vendor.check_stock(@item2)
	end

	def test_stock
		assert_equal 0, @vendor.inventory.size
		@vendor.stock(@item1, 30)
		assert_equal 1, @vendor.inventory.size
		assert_includes @vendor.inventory.keys, @item1
		@vendor.stock(@item2, 12)
		assert_equal 2, @vendor.inventory.size
		assert_includes @vendor.inventory.values, 12
	end
	
	def test_sell
		@vendor.stock(@item1, 30)
		assert_equal 30, @vendor.check_stock(@item1)
		@vendor.sell(@item1, 25)
		assert_equal 5, @vendor.check_stock(@item1)
		@vendor.stock(@item2, 12)
		assert_equal 12, @vendor.check_stock(@item2)
		@vendor.sell(@item2, 100)
		assert_equal 0, @vendor.check_stock(@item2)
	end
end
