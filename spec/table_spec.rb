require './lib/table'

describe Robot do
  before(:each) do
    @table = Table.new(5, 5)
  end

  describe '#initialize' do
    it 'should have a width attribute which equals 5' do
      expect(@table.width).to eq(5)
    end

    it 'should have a height attribute which equals 5' do
      expect(@table.height).to eq(5)
    end

    it 'should have a max_x_position attribute which equals 4' do
      expect(@table.max_x_position).to eq(4)
    end

    it 'should have a max_y_position attribute which equals 4' do
      expect(@table.max_y_position).to eq(4)
    end
  end

end