require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/item.rb'

class ItemTest < Minitest::Test

	def setup
		@item1 = Item.new({name: 'Peach', price: "$0.75"})
                @item2 = Item.new({name: 'Tomato', price: '$0.50'})
	end

	def test_it_exists
		assert_instance_of Item, @item1
		assert_instance_of Item, @item2
	end

	def test_its_variables
		assert_equal "Tomato", @item2.name
		assert_equal "$0.50", @item2.price
	end

end
