class Grid 
  attr_reader :size,
              :bot,
              :princess,
              :grid
  def initialize(size, bot_x, bot_y, grid)
    @size     = size 
    @bot      = [bot_x, bot_y] 
    @grid     = grid
    @princess = find_element('p')
    raise ArgumentError, "Please enter a number less than 100." unless size <= 100
    raise ArgumentError, "Please enter the correct number of columns for your grid size." unless grid.all? {|e| e.length == size} == true
    raise ArgumentError, "Please place 'm' in the coordinates you entered for the bot." unless [bot_x, bot_y] == find_element('m')
  end

  def find_element(e) 
    coordinates = []
    @grid.each_with_index do |row, index|
      if row.include?(e)
        coordinates << index 
        coordinates << row.chars.index(e)
      end
    end
    coordinates
  end   

  # def place_princess(size, bot)
  #    princess = []
  #   2.times do 
  #     princess << rand(0..(size - 1))  
  #   end 
  #   if princess != bot 
  #     @princess = princess 
  #   else 
  #     place_princess(size, bot)
  #   end 
  # end
end