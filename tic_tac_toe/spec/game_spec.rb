require_relative '../lib/game'

describe Game do
  subject(:newgame) { described_class.new }

  context 'when winner is X' do
    before do
      p newgame.round.winner.name
    end
  end
end
