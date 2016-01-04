require 'gosu'
class Player
  attr_accessor :x, :y
  def initialize(x, y)
    @image = Gosu::Font.new(20)
    @x = x
    @y = y
  end

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
