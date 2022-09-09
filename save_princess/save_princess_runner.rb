require_relative 'lib/save_princess'

puts "Please enter a number between 3 & 100 to choose the grid size."
grid_size = gets.chomp.to_i
grid = []
row = 1
grid_size.times do 
  puts "Please enter row #{row} for your grid. Please place 'p' in a corner and 'm' in the middle of the grid."
  grid << gets.chomp 
  row +=1
end

new_grid = Grid.new(grid_size, grid)
new_game = SavePrincess.new(new_grid)
new_game.find_path.each do |e|
  p e
end