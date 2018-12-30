require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::Die do
  let(:die) { described_class.new(:blue, 3) }

  it 'has a color' do
    expect(die.color).to eq(:blue)
  end

  it 'has a value' do
    expect(die.value).to eq(3)
  end

  describe 'rolled?' do
    context 'when not rolled' do
      let(:die) { described_class.new(:blue) }

      it 'returns false' do
        expect(die).not_to be_rolled
      end
    end

    context 'when rolled' do
      let(:die) { described_class.new(:blue, 2) }

      it 'returns false' do
        expect(die).to be_rolled
      end
    end
  end

  describe '#roll' do
    it 'rolls the die' do
      die.roll(1)
      expect(die.value).to eq(1)
    end
  end
end