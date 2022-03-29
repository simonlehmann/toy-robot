require_relative './lib/table'
require_relative './lib/robot'

class ToyRobot

  def initialize
    @table = Table.new(5, 5)
		@robot = Robot.new(@table)
  end

  def run
    $stdout.print "Options: PLACE X,Y,F; UNPLACE; MOVE; LEFT; RIGHT; REPORT; QUIT\n"

    # Reading user input
    loop do
      input = gets.chomp

      # Skip iteration if blank input
      next if input.empty?

      # Separate command from its arguments
      input_elements = input.split(' ')

      command = input_elements.first

      case command
      when 'PLACE'
        # Expect "PLACE <x>,<y>,<f>" - no spaces between arduments
        command_args = input_elements.last.split(',')
        
        x_position, y_position, facing = command_args

        @robot.place(x_position.to_i, y_position.to_i, facing)
      when 'UNPLACE'
        @robot.unplace
      when 'MOVE'
        @robot.move
      when 'LEFT'
        @robot.left
      when 'RIGHT'
        @robot.right
      when 'REPORT'
        @robot.report
      when 'QUIT'
        $stdout.print "Quitting...\n"
        break
      else
        $stdout.print "Unexpected input.\n"
      end

    end
  end
end

ToyRobot.new.run