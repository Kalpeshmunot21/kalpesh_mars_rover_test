#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'support'))

require 'controller/robot_controller'

RobotController.start
