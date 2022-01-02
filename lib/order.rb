require_relative "menu"

class Order
  attr_accessor :order, :total

  def initialize 
    @order = []
    @total = 0
  end

  def add(dish)
    @order << dish
    @total += dish.values[0]
  end

  def show_order
    @order.each { |dish| puts "#{dish.keys[0]} £#{dish.values[0]}" }
    puts "TOTAL = £#{@total}"
  end
end
