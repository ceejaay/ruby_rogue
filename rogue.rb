require 'gosu'
require './player'
require './map'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Rogue"
    @map = Map.new(100, 200)
    @player = Player.new(100, 300)
    @text = Gosu::Font.new(20)
    @distance = Gosu::Font.new(20)
    @map_test = Gosu::Font.new(20)
    @map_coordinates_text = Gosu::Font.new(20)

  end 

  def update
  end

  def button_down(id)
     case id
       when Gosu::KbLeft
         if @map.solid?(@player.x - 20, @player.y)
           nil
         else
           @player.west
         end
       when Gosu::KbRight
         if @map.solid?(@player.x + 20, @player.y)
           nil
         else
           @player.east
         end
       when Gosu::KbUp
         if @map.solid?(@player.x, @player.y - 20)
           nil
         else
           @player.north
         end
       when Gosu::KbDown
         if @map.solid?(@player.x, @player.y + 20)
           nil
         else
           @player.south
         end
       when Gosu::KbEscape
         close
     end
  end

  def draw
    @player.draw
    @map.draw
    @text.draw("Player: X => #{@player.x} Y => #{@player.y}", 10, 30, 0xff_ffff00)
    @distance.draw(" Distance between player and tile => #{Gosu::distance(@player.x, @player.y, @map.x, @map.y)}", 50, 50, 0xff_ffff00)
    if @map.solid?(@player.x - 20, @player.y)
      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    elsif @map.solid?(@player.x + 20, @player.y)
      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    elsif @map.solid?(@player.x, @player.y + 20)
      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    elsif @map.solid?(@player.x, @player.y - 20)
      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    else
      @map_test.draw("Collision => False", 10, 80, 0xff_ffff00)
    end 
      @map_coordinates_text.draw("Map X => #{@map.x} Map Y => #{@map.y}", 300, 30, 0xff_ffff00)
  end

end

window = GameWindow.new
window.show
