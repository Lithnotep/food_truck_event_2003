require 'minitest/autorun'
require 'minitest/pride'
require './lib/item.rb'
require './lib/food_truck.rb'
require './lib/event.rb'
require 'pry'

class EventTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
  end

  def test_it_exist
    assert_instance_of Event, @event
  end

  def test_has_attributes
    assert_equal "South Pearl Street Farmers Market" , @event.name
    assert_equal [], @event.food_trucks
  end

  def test_can_add_food_truck
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
    @event.add_food_truck(@food_truck1)
    assert_equal 1, @event.food_trucks.length
    @event.add_food_truck(@food_truck2)
    assert_equal 2, @event.food_trucks.length
    @event.add_food_truck(@food_truck3)
    assert_equal 3, @event.food_trucks.length
  end

  def test_can_food_truck_names
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    assert_equal ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"], @event.food_truck_names
  end

  def test_can_food_trucks_that_sell
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    assert_equal [@food_truck1, @food_truck3], @event.food_trucks_that_sell(@item1)
    assert_equal [@food_truck2], @event.food_trucks_that_sell(@item4)
  end


end
