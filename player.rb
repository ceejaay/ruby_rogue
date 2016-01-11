require 'gosu'
class Player
  attr_accessor :x, :y, :go_north, :go_south, :go_east, :go_west
  def initialize(x, y)
    @image = Gosu::Font.new(20)
    @x = x
    @y = y
    @go_north = self.y - 20
    @go_south = self.y + 20
    @go_east = self.x + 20
    @go_west = self.x - 20
  end

#need to add and or subtract for the opposite values.
  def east
    @x += 20.0
  end

  def west
    @x -= 20.0 
  end

  def north
    @y -= 20.0
  end

  def south
    @y += 20.0
  end

  def draw
    @image.draw("@", @x, @y, 0xff_ffff00)
  end
end
