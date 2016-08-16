require 'model/robot_model'

class RobotController
  class << self 
    def start
      robots_with_instructions = Array.new
      puts "Please insert plateau orientation"
      plateau = get_plateau
      return unless plateau
      begin
        puts "Insert input (type ctrl-d when you have done)"
        robot = get_robot
        robots_with_instructions << [robot, get_robots_instructions] if robot
      end while robot

      for robot_with_instructions in robots_with_instructions
        robot = robot_with_instructions.first
        instructions = robot_with_instructions.last

        for instruction in instructions.to_s.split('')
          case instruction
          when 'M' then robot.move
          when 'R', 'L' then robot.rotate(instruction == 'L')
          end
        end if instructions

        puts 'ROBOT OUT OF PLATEAU BOUNDS' unless robot.in_plateau?(plateau.width, plateau.height)
        puts '%d %d %s' % robot.position
      end
    end

    protected
    def get_plateau
      until (input = gets) && (input =~ /(\d+)\s+(\d+)/)
        return nil if input.to_s.chomp.empty?
        puts "Invalid input"
      end
      Plateau.new($1.to_i, $2.to_i)
    end

    def get_robot
      until (input = gets) && (input =~ /(\d+)\s+(\d+)\s+([NESW])/i)
        return nil if input.to_s.chomp.empty?
        puts "Invalid input"
      end
      Robot.new($1.to_i, $2.to_i, $3.to_s.upcase)
    end

    def get_robot_instructions
      until (input = gets) && (input =~ /([RLM]+)/i)
        return nil if input.to_s.chomp.empty?
        puts "Invalid input"
      end
      return $1.to_s.upcase
    end
  end
end
