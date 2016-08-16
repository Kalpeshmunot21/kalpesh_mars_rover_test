#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../support'))

require 'test/unit'
require 'model/robot_model'

class TestRobot < Test::Unit::TestCase

  def test_initialization
    robot = Robot.new(1, 2, 'W')
    assert_equal(robot.x, 1)
    assert_equal(robot.y, 2)
    assert_equal(robot.cordinates, 3)
  end

  def test_movement
    robot = Robot.new(1, 1, 'N')
    robot.move
    assert_equal(robot.position, [1, 2, 'N'])
    
    robot = Robot.new(1, 1, 'E')
    robot.move
    assert_equal(robot.position, [2, 1, 'E'])

    robot = Robot.new(1, 1, 'S')
    robot.move
    assert_equal(robot.position, [1, 0, 'S'])

    robot = Robot.new(1, 1, 'W')
    robot.move
    assert_equal(robot.position, [0, 1, 'W'])
  end

  def test_rotation
    robot = Robot.new(0, 0, 'N')
    robot.rotate(false)
    assert_equal(robot.position, [0, 0, 'E'])

    robot = Robot.new(0, 0, 'N')
    robot.rotate(true)
    assert_equal(robot.position, [0, 0, 'W'])

    robot = Robot.new(0, 0, 'W')
    robot.rotate(false)
    assert_equal(robot.position, [0, 0, 'N'])
  end

  def test_position_reporting
    robot = Robot.new(1, 1, 'W')
    assert_equal(robot.position, [1, 1, 'W'])
  end

  def test_plateau_inclusion 
    robot = Robot.new(2, 2, 'W')
    assert(!robot.in_plateau?(1, 1))
    assert(robot.in_plateau?(2, 2))
    assert(robot.in_plateau?(3, 3))
  end
end
