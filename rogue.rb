require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Rogue"
    @map = Map.new(100, 100)
    @player = Player.new(100, 200)
    @text = Gosu::Font.new(20)
    @distance = Gosu::Font.new(20)
    @map_test = Gosu::Font.new(20)

  end

  def update
  end

  def button_down(id)
       
     @player.left if id == Gosu::KbLeft
     @player.right if id == Gosu::KbRight
     @player.south if id == Gosu::KbUp
     @player.north if id == Gosu::KbDown
     close if id == Gosu::KbEscape end

  def draw
    @player.draw
    @map.draw
    @text.draw("Player: X => #{@player.x} Y => #{@player.y}", 10, 30, 0xff_ffff00)
    @distance.draw("#{Gosu::distance(@player.x, @player.y, @map.x, @map.y)}", 50, 50, 0xff_ffff00)
    if @map.solid?(@player.x, @player.y)
      @map_test.draw("True", 70, 70, 0xff_ffff00)
    else
      @map_test.draw("False", 70, 70, 0xff_ffff00)
    end

  end end

class Player
  attr_accessor :x, :y
  def initialize(x, y)
    @image = Gosu::Font.new(20)
    @x = x
    @y = y
  end

  def right
    @x += 20.0
  end

  def left
    @x -= 20.0 
  end

  def north
    @y += 20.0
  end

  def south
    @y -= 20.0
  end

  def draw
    @image.draw("@", @x, @y, 0xff_ffff00)
  end
end

class Map
    attr_accessor :x, :y

  def initialize(x, y)
    #@raw_map = File.readlines("media/map.txt").map {|lines| lines.chomp}
    @x = x
    @y = y
    @tile = Gosu::Font.new(20)

  end

  def draw
    @tile.draw("#", @x, @y, 0xff_fff00)
  end

  def solid?(x, y)
    if y.between?(@y, @y + 20)
      elsif
       @y.between?(y, y + 20)
      elsif
        x.between?(@x, @x + 20)
      elsif
        @x.between?(x, x + 20)
      end
#this one evaluates half of it.
      #@x.between?(x, x + 20) 
#this one keeps it from going south.
     # @y.between?(y, y + 20) 
     #this one evalutes the other half.
#this one will keep it from going west or left
      #x.between?(@x, @x + 20) 
#this blocks it when you want to go north
      #y.between?(@y, @y + 20) 
  end 
end

window = GameWindow.new
window.show
