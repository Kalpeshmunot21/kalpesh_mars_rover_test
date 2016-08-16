
class Plateau < Struct.new(:width, :height); end;

class Robot
  CORDINATES = ['N', 'E', 'S', 'W'].freeze

  attr_accessor :x, :y, :cordinates

  def initialize(x, y, cordinates)
    @x, @y, @cordinates = x, y, CORDINATES.find_index(cordinates)
  end

  def move
    case @cordinates
    when 0 then @y += 1 # Move towards North
    when 1 then @x += 1 # Move towards East
    when 2 then @y -= 1 # Move towards South
    when 3 then @x -= 1 # Move towards West
    end
  end

  def rotate(counterclockwise = false)
    if counterclockwise
      @cordinates == 0 ? @cordinates = 3 : @cordinates -= 1
    else
      @cordinates == 3 ? @cordinates = 0 : @cordinates += 1
    end
  end

  def position
    [ @x, @y, Robot::CORDINATES[@cordinates] ]
  end

  def in_plateau?(width, height)
    @x.between?(0, width) && @y.between?(0, height)
  end
end
