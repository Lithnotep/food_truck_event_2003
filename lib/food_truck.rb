require './lib/item.rb'
require 'pry'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory[item] == nil
      @inventory[item] = 0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    check_stock(item)
    @inventory[item] += amount
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |item|
      item_value = (item[0].price).chop.to_f

      binding.pry
    end
    revenue
  end


end
