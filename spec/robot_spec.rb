require './lib/robot'

describe Robot do
  before(:each) do
    @table = Table.new(5, 5)
    @robot = Robot.new(@table)
  end

  describe '#initialize' do
    it 'should have a current_x_position attribute which is nil' do
      expect(@robot.current_x_position).to be_nil
    end

    it 'should have a current_y_position attribute which is nil' do
      expect(@robot.current_y_position).to be_nil
    end

    it 'should have a current_facing attribute which is nil' do
      expect(@robot.current_facing).to be_nil
    end

    it 'should have a table attribute which is a Table object' do
      expect(@robot.table).to be_a(Table)
    end
  end

  describe 'safe robot placement' do
    it 'should place if requested placement would be safe' do
      @robot.place(1, 2, 'NORTH')
      
      expect(@robot.current_x_position).to_not eq(nil)
      expect(@robot.current_y_position).to_not eq(nil)
      expect(@robot.current_facing).to_not eq(nil)
    end

    it 'should skip if requested placement would be out-of-bounds' do
      @robot.place(0, -2, 'EAST')

      expect(@robot.current_x_position).to eq(nil)
      expect(@robot.current_y_position).to eq(nil)
      expect(@robot.current_facing).to eq(nil)
    end
  end

  describe 'safe robot movement' do
    it 'should move if requested movement would be safe' do
      @robot.place(1, 2, 'NORTH')
      @robot.move

      expect(@robot.current_x_position).to eq(1)
      expect(@robot.current_y_position).to eq(3)
      expect(@robot.current_facing).to eq('NORTH')
    end

    it 'should skip if requested movement would be out-of-bounds' do
      @robot.place(0, 4, 'NORTH')
      @robot.move

      expect(@robot.current_x_position).to eq(0)
      expect(@robot.current_y_position).to eq(4)
      expect(@robot.current_facing).to eq('NORTH')
    end
  end

  describe 'left turn' do
    it 'should move if requested movement would be safe' do
      @robot.place(1, 2, 'NORTH')
      @robot.left

      expect(@robot.current_x_position).to eq(1)
      expect(@robot.current_y_position).to eq(2)
      expect(@robot.current_facing).to eq('WEST')
    end

    it 'should skip if rebot not placed' do
      @robot.place(1, 2, 'NORTH')
      @robot.left

      expect(@robot.current_x_position).to eq(1)
      expect(@robot.current_y_position).to eq(2)
      expect(@robot.current_facing).to eq('WEST')
    end
  end

  describe 'right turn' do
    it 'should move if requested movement would be safe' do
      @robot.place(1, 2, 'NORTH')
      @robot.right

      expect(@robot.current_x_position).to eq(1)
      expect(@robot.current_y_position).to eq(2)
      expect(@robot.current_facing).to eq('EAST')
    end
  end

end