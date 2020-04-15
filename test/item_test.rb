require 'minitest/autorun'
require 'minitest/pride'
require './lib/item.rb'
require 'pry'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  def test_it_exist
    assert_instance_of Item, @item1
  end

  def test_has_attributes
    assert_equal 'Peach Pie (Slice)' , @item1.name
    assert_equal "$3.75", @item1.price
  end

  def
  end
end
