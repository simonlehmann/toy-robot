class Table

  attr_reader :width,
              :height,
              :max_x_position,
              :max_y_position
  
  def initialize(width, height)
    @width          = width
    @height         = height
    @max_x_position = @width  - 1
    @max_y_position = @height - 1

    # TODO: Add validation to catch invalid width and height arguments
  end

  def safe_position?(x_position, y_position)
    # Check that both given x and y positions fall within the bounds of the table
    x_position_safe = x_position >= 0 && x_position <= @max_x_position
    y_position_safe = y_position >= 0 && y_position <= @max_y_position
    
    return x_position_safe && y_position_safe
  end
end