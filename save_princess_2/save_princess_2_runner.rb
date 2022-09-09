require_relative 'lib/save_princess'

puts "Please enter a number less than 100 to choose the grid size."
grid_size = gets.chomp.to_i
grid = []
row = 1
puts "Please enter the number of rows down you would like to place the bot, between 0 & #{grid_size - 1}."
bot_x = gets.chomp.to_i 
puts "Please enter the number of columns over you would like to place the bot, between 0 & #{grid_size - 1}."
bot_y = gets.chomp.to_i 

grid_size.times do 
  puts "Please enter row #{row} for your grid. Please place 'p' where you would like the princess to be
   and 'm' in the coordinates you entered above (#{bot_x}, #{bot_y})."
  grid << gets.chomp 
  row +=1
end

new_grid = Grid.new(grid_size, bot_x, bot_y, grid)
new_game = SavePrincess.new(new_grid)
puts "The first move to find the princess is #{new_game.find_move}."