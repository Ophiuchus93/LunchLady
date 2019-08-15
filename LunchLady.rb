# This was a very difficult assignment. I struggled figuring out how to grab 
# push into the arrays. I also struggled figuring out how ti get the cart to 
# total. Any feedback is appreciated. Thank you! 

require "pry"
# Classes
# LunchLady
# User
# MainDish
# SideDish
class LunchLady 
  attr_accessor :name, :wallet

  def initialize
    @foods = [
      item1 = MainDish.new("Sloppy Joe", 3.00),
      item2 = MainDish.new("Grilled Cheese", 2.00),
      item3 = MainDish.new("Corn Dog", 1.50)
    ]

    @sides = [
    item1 = SideDish.new("French Fries", 0.75),
    item2 = SideDish.new("Green Salad", 1.00),
    item3 = SideDish.new("Fruit Cup", 1.25)
    ]
    @cart = []
    @total = []
    puts "-- Welcome to Ruby Cafe --"
    puts "What is your name?"
    print "> "
    name = gets.strip
    puts "How much money do you have?"
    print "> "
    wallet = gets.to_i
    puts " Welcome, #{name} you have $#{wallet} available."
    
    main_menu
  end
  def main_menu
    puts "Please select a category"
    puts "1) Main Dish"
    puts "2) Side Dish"
    puts "3) Checkout"
    puts "4) exit"
    print "> "
  
  case gets.to_f
  
  when 1 
   
    @foods.each_with_index do |food, index|
      puts "#{index + 1}) #{food.item} #{food.price}"
    end
    puts "Please make a selection"
    print "> "
    selection = gets.strip.to_i
    choice = @foods[selection - 1].item
    cost = @foods[selection - 1].price
    @cart << choice
    @total << cost
    puts choice
    puts cost
    # binding.pry
    main_menu
  when 2

    @sides.each_with_index do |side, index|
      puts "#{index + 1}) #{side.item} #{side.price}"
    end
    puts "Please make a selection"
    print "> "
    selection = gets.strip.to_i
    choice = @sides[selection - 1].item
    cost = @sides[selection - 1].price
    @cart << choice
    @total << cost
    puts choice
    puts cost
    # binding.pry
    main_menu
    when 3
    check_out
  when 4
    exit(true)  
  end
end
# binding.pry
class MainDish
  attr_reader :item, :price
  def initialize(item, price)
    @item = item
    @price = price
  end
end


  class SideDish
    attr_reader :item, :price
  def initialize(item, price)
    @item = item
    @price = price
  end
end
end

def check_out
  grand = @total.inject(0) {|sum, x| sum + x}
  puts "Your items are"
  puts @cart
  puts "Your order total is " + grand.to_s
end  

LunchLady.new