require 'set_board'

describe SetBoard do

  before(:each) do
    @set_board = SetBoard.new
  end

  it 'creates a new instantiation of SetBoard class' do
    expect(@set_board).to be_instance_of(SetBoard)
  end

  it 'instantiates with an empty @game_board array' do
    expect(@set_board.game_board).to eq([])
  end

  describe "#create_board" do

    it 'creates a 12x12 whitespace board' do
      expect(@set_board.create_board).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                             [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]])
    end

  end

  describe "#placeShip" do

    it 'fills array with a 2x1 ship vertically' do
      @set_board.create_board
      expect(@set_board.placeShip(1,1, "v")).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    ["O", nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    ["O", nil, nil, nil, nil, nil, nil, nil, nil, nil]])
    end

    it 'fills array with a 2x1 ship horizontally' do
      @set_board.create_board
      expect(@set_board.placeShip(1,1, "h")).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    ["O", "O", nil, nil, nil, nil, nil, nil, nil, nil]])
    end
  end

end
