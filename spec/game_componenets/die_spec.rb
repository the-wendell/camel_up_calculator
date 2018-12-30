require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::Die do
  let(:die) { described_class.new(:blue, :standard) }

  it 'has a color' do
    expect(die.color).to eq(:blue)
  end

  describe '#possible_values' do
    context 'when type is standard' do
      it 'returns the correct values' do
        expect(die.possible_values).to eq(CamelUpCalculator::STANDARD_DIE_VALUES)
      end
    end

    context 'when type is bonus' do
      let(:die) { described_class.new(:blue, :bonus) }

      it 'returns the correct values' do
        expect(die.possible_values).to eq(CamelUpCalculator::BONUS_DIE_VALUES)
      end
    end

    context 'when type is not valid' do
      let(:die) { described_class.new(:blue, :wrong) }

      it 'raises an argument error' do
        expect { die.possible_values }.to raise_error('wrong is an invalid die type')
      end
    end
  end
end