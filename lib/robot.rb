# require_relative 'table'

class Robot

  attr_reader :current_x_position,
              :current_y_position,
              :current_facing,
              :table

  FACINGS = ['NORTH', 'EAST', 'SOUTH', 'WEST'].freeze

  def initialize(table)
    @current_x_position = nil
    @current_y_position = nil
    @current_facing     = nil
    @table              = table

    # TODO: Add validations to catch invalid or no table parsed
	end

  def place(requested_x_position, requested_y_position, requested_facing)
    # Validate requested placement
    # return unless self.valid_placement?(x_position, y_position, facing)

    # Check safety of requested placement
    if @table.safe_position?(requested_x_position, requested_y_position)
      @current_x_position = requested_x_position
      @current_y_position = requested_y_position
      @current_facing     = requested_facing
    else
      $stdout.print "Requested position would be out-of-bounds, placement skipped!"
    end
  end

  def unplace
    @current_x_position = nil
    @current_y_position = nil
    @current_facing     = nil
  end

  def placed?
    # Check whether position and faceing are present
    @current_x_position && @current_y_position && @current_facing
  end

  def left
    return unless self.placed?

    # TODO: Consider implementing Array.rotate for turn left/right solution

    # Rotate compass counter-clockwise
    @current_facing = case @current_facing
		when 'NORTH'
			'WEST'
		when 'EAST'
			'NORTH'
		when 'SOUTH'
			'EAST'
    when 'WEST'
			'SOUTH'
		end
  end

  def right
    return unless self.placed?

    # TODO: Consider implementing Array.rotate for turn left/right solution

    # Rotate compass clockwise
    @current_facing = case @current_facing
		when 'NORTH'
			'EAST'
		when 'EAST'
			'SOUTH'
		when 'SOUTH'
			'WEST'
    when 'WEST'
			'NORTH'
		end
  end

  def move(move_length = 1) # TODO: Add move_length to take number of steps to move in current facing
    return unless self.placed?

    next_x_position, next_y_position = self.next_move(1)

    # Check if proposed move would result in safe position
    if @table.safe_position?(next_x_position, next_y_position)
      @current_x_position = next_x_position
      @current_y_position = next_y_position
    else
      $stdout.print "Next position would be out-of-bounds, move skipped!\n"
    end

  end

  def report
    if self.placed?
      message = "Position: #{@current_x_position},#{@current_y_position} Facing: #{@current_facing}\n"
    else
      message = "Robot not placed, nothing to report...\n"
    end

    $stdout.print message
  end

  private

  def next_move(move_length = 1)

    case @current_facing
    when 'NORTH'
      [@current_x_position, @current_y_position + move_length]
    when 'EAST'
      [@current_x_position + move_length, @current_y_position]
    when 'SOUTH'
      [@current_x_position, @current_y_position - move_length]
    when 'WEST'
      [@current_x_position - move_length, @current_y_position]
    end
  end
end