require 'minitest/autorun'
require 'minitest/pride'
require './lib/item.rb'
require './lib/food_truck.rb'
require 'pry'

class FoodTruckTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  def test_it_exist
    assert_instance_of FoodTruck, @food_truck
  end

  def test_has_attributes
    assert_equal "Rocky Mountain Pies" , @food_truck.name
    assert_equal ({}), @food_truck.inventory
  end

  def test_can_check_stock
    assert_equal 0, @food_truck.check_stock(@item1)
    assert_equal 0, @food_truck.check_stock(@item2)
  end

  def test_can_stock
    assert_equal 0, @food_truck.check_stock(@item1)
    @food_truck.stock(@item1, 30)
    assert_equal 30, @food_truck.check_stock(@item1)
    @food_truck.stock(@item1, 25)
    assert_equal 55, @food_truck.check_stock(@item1)
    @food_truck.stock(@item2, 12)
    assert_equal 55, @food_truck.inventory[@item1]
    assert_equal 12, @food_truck.inventory[@item2]
  end
  


end