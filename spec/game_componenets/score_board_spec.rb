require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::ScoreBoard do
  let(:score_board) { described_class.new }
  let(:results) do
    OpenStruct.new(
      yellow: :first,
      blue: :second,
      orange: :third,
      white: :fourth,
      green: :fifth
    )
  end

  describe '#race_completed' do
    it 'adds the results of the race to the score_board' do
      expected = { first: 0, second: 0, third: 0, fourth: 0, fifth: 0 }

      score_board.race_completed(results)

      expect(score_board.yellow).to eq(expected.merge(first: 1))
      expect(score_board.blue).to eq(expected.merge(second: 1))
      expect(score_board.orange).to eq(expected.merge(third: 1))
      expect(score_board.white).to eq(expected.merge(fourth: 1))
      expect(score_board.green).to eq(expected.merge(fifth: 1))
    end
  end

  describe '#total_number_of_races' do
    it 'returns the total number of races' do
      score_board.race_completed(results)
      score_board.race_completed(results)
      score_board.race_completed(results)

      expect(score_board.total_number_of_races).to eq(3)
    end
  end

  context 'when calculating odds' do
    before do
      score_board.race_completed(results)
      score_board.race_completed(results)
      results.yellow = :fourth
      results.white = :first
      score_board.race_completed(results)
    end

    describe '#all_odds_for' do
      it 'returns the odds for a color' do
        expect(score_board.all_odds_for(:yellow)).to eq(
          first: 0.67,
          second: 0,
          third: 0,
          fourth: 0.33,
          fifth: 0
        )
      end
    end

    describe '#odds_for' do
      it 'returns the odds for a given color and position' do
        expect(score_board.odds_for(:yellow, :first)).to eq(0.67)
      end
    end
  end
end