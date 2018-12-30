require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::Tile do
  context 'when "oasis"' do
    let(:tile) { described_class.new(:oasis) }

    describe '#oasis?' do
      it 'returns true' do
        expect(tile).to be_oasis
      end
    end

    describe '#desert?' do
      it 'returns false' do
        expect(tile).not_to be_desert
      end
    end
  end

  context 'when "desert"' do
    let(:tile) { described_class.new(:desert) }

    describe '#oasis?' do
      it 'returns false' do
        expect(tile).not_to be_oasis
      end
    end

    describe '#desert?' do
      it 'returns true' do
        expect(tile).to be_desert
      end
    end
  end

  context 'when type is invalid' do
    let(:tile) { described_class.new(:wrong) }

    it 'raises an argument error' do
      expect { tile }.to raise_error('wrong is an invalid Tile type')
    end
  end
end