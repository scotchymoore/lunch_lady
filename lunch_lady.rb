require 'pry'


@order = []

def main_dishes_menu
  puts " What Main Dish would you like?
            1. Meatloaf $5.00
            2. Mystery Meat $3.00
            3. Slop $1.00"
main_dishes = [
  { dish: 'Meatloaf', price: 5.00 },
  { dish: 'Mystery Meat', price: 3.00 },
  { dish: 'Slop', price: 1.00 }
]
puts "Select Main dish: "

user_order = gets.strip.to_i
case user_order
  when 1
    @order << main_dishes[0]
  when 2
    @order << main_dishes[1]
  when 3
    @order << main_dishes[2]
  else
    puts "Invalid selection. Choose again."
    main-dishes_menu
  end
  side_dishes_menu
end

def side_dishes_menu
  puts " ****** Side Dishes *****
          1. Carrots $1.75
          2. Mystery Yogurt $1.00
          3. Beef Jerky $.50"

side_dishes = [
  {dish: 'Carrots', price: 1.75},
  {dish: 'Mystery Yogurt', price: 1.00},
  {dish: 'Beef Jerky', price: 0.50}
]
puts "Please order a side dish: "
user_order = gets.strip.to_i
case user_order
  when 1
    @order << side_dishes[0]
  when 2
    @order << side_dishes[1]
  when 3
    @order << side_dishes[2]
  else
    puts "Invalid selection. Choose again."
    side_dishes_menu
  end
  wallet

end

def another_side
  puts "Would you like another side dish?
        1. Yes
        2. No"
        add_side = gets.strip.to_i
        case add_side
          when 1
            side_dishes_menu
          when 2
            final_recap
          else
            puts "Invalid choice. Try again."
            another_side
        end
end

def wallet
  tab = @order.collect { |p| p[:price]}
  tab = tab.inject(:+)
  left = (7.00 - tab)
  puts "You have spent $#{tab} so far.  You have $#{left} left.\n"
    if tab < 7.00
      puts "You can make another side order."
      another_side
    elsif tab == 7.00
      puts "You have spent all your money."
      final_recap
    else tab > 7.00
      puts "You have over spent.  Your last item was deleted."
      @order.pop
      tab = @order.collect { |p| p[:price]}
      tab = tab.inject(:+)
      puts "You now have spent $#{tab}."
    end
end

def start_over
  puts "Do you wish to keep your order or start over:
        1. Yes keep my order.
        2. No. I want to cancel my order.
        3. Exit."
        choice = gets.strip.to_i
        case choice
        when 1
          puts "\nThanks for dining at Lunch Lady Land.
                Home of the famous Sloppy Joe!\n\n"
        when 2
          cancel_order
        when 3
          exit
        else
          puts "Invalid selection. Try again."
          start_over
        end
end

def cancel_order
  @order.clear
  puts "\nYour order has been canceled.  Start again.\n"
  main_dishes_menu
end

def order_recap
 puts @order.collect { |d| "#{d[:dish]}"}
end

def order_tab
  tab = @order.collect { |p| p[:price]}
  tab = tab.inject(:+)
 puts "\n\nYour total is $#{tab}\n\n"
end

def final_recap
  puts "\n\n\Here is what you ordered: "
  order_recap
  order_tab
  start_over
end




puts "\n\n\nWelcome to Lunch Lady Land!
Where all the ladies where hair nets
and serve our World Famous Sloppy Joe with a smile!\n\n"
puts "You have a $7.00 limit.\n\n"
main_dishes_menu
