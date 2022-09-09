class Grid 
  attr_reader :size,
              :bot, 
              :princess
  def initialize(size, bot)
    @size     = size 
    @bot      = bot 
    @princess = place_princess(size, bot)
  end

  def place_princess(size, bot)
     princess = []
    2.times do 
      princess << rand(0..(size - 1))  
    end 
    if princess != bot 
      @princess = princess 
    else 
      place_princess(size, bot)
    end 
  end
end