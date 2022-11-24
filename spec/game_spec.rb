require_relative '../lib/game'

describe Game do
  describe '#verify_input' do
    subject(:input_verified) { described_class.new }

    context 'when player types a valid input in column 5' do
      valid_input = 5
      it 'returns true' do
        result = input_verified.verify_input(valid_input)
        expect(result).to be true
      end
    end

    context 'when player tyoes input where column is full' do
      let(:game_board) { input_verified.instance_variable_get(:@board) }

      before do
        game_board.grid[0][4] = 'X'
      end

      it 'returns false' do
        invalid_input = 4
        result = input_verified.verify_input(invalid_input)
        expect(result).to be false
      end
    end
  end

  describe '#game_over' do
    context 'when a player wins' do
      subject(:end_game) { described_class.new }
      let(:board) { end_game.instance_variable_get(:@board) }
      let(:player) { instance_double(Player, name: 'Anna', symbol: 'X') }

      before do
        allow(board).to receive(:check_horizontal).and_return(true)
      end

      it "announces player's name" do
        expect(end_game).to receive(:puts).with('Anna won! Well done!')
        end_game.game_over?(player)
      end
    end
  end
end