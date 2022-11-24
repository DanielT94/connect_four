require_relative '../lib/board'

describe Board do
  let(:blue_circle) { described_class.new.blue_circle }
  let(:red_circle) { described_class.new.red_circle }

  describe '#update_board' do
    subject(:board_updated) { Board.new }

    context 'when board is updated at 1st row, 1st column with red circle' do
      before do
        board_updated.update_board(1, 1, red_circle)
      end

      it 'updates correct location on board' do
        board = board_updated.instance_variable_get(:@grid)
        updated_cell = board[1][1]
        expect(updated_cell).to eq(red_circle)
      end
    end

    context 'when the board is updated at 5th row, 3rd column with blue circle' do
      before do
        board_updated.update_board(5, 3, blue_circle)
      end

      it 'updates correct loacation on board' do
        board = board_updated.instance_variable_get(:@grid)
        updated_cell = board[5][3]
        expect(updated_cell).to eq(blue_circle)
      end
    end
  end

  describe '#check_vertical' do
    subject(:vertical_check) { described_class.new }
    let(:grid) { vertical_check.instance_variable_get(:@grid) }

    before do
      grid[0][1] = 'X'
      grid[1][1] = 'X'
      grid[2][1] = 'X'
      grid[3][1] = 'X'
    end

    context 'when there are four in a row vertically' do
      it 'returns true' do
        result = vertical_check.check_vertical(0, 1, 'X')
        expect(result).to be true
      end
    end
  end

  describe '#check_horizontal' do
    subject(:horizontal_check) { described_class.new }
    let(:grid) { horizontal_check.instance_variable_get(:@grid) }

    before do
      grid[5][2] = 'X'
      grid[5][3] = 'X'
      grid[5][4] = 'X'
      grid[5][5] = 'X'
    end

    context 'when there are four in a row horizontally' do
      it 'returns true' do
        result = horizontal_check.check_horizontal(5, 2, 'X')
        expect(result).to be true
      end
    end
  end

  describe '#check_up_diagonal' do
    subject(:up_diagonal_check) { described_class.new }
    let(:grid) { up_diagonal_check.instance_variable_get(:@grid) }

    before do
      grid[2][5] = 'X'
      grid[3][4] = 'X'
      grid[4][3] = 'X'
      grid[5][2] = 'X'
    end

    context 'when there are four in a row diagonally' do
      it 'returns true' do
        result = up_diagonal_check.check_up_diagonal(2, 5, 'X')
        expect(result).to be true
      end
    end
  end

  describe '#check_down_diagonal' do
    subject(:down_diagonal_check) { described_class.new }
    let(:grid) { down_diagonal_check.instance_variable_get(:@grid) }

    before do
      grid[2][2] = 'X'
      grid[3][3] = 'X'
      grid[4][4] = 'X'
      grid[5][5] = 'X'
    end

    context 'when there are four in a row diagonally' do
      it 'returns true' do
        result = down_diagonal_check.check_down_diagonal(2, 2, 'X')
        expect(result).to be true
      end
    end
  end


end
