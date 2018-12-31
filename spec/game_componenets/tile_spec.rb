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

    describe '#camel_stack?' do
      it 'returns false' do
        expect(tile).not_to be_camel_stack
      end
    end

    describe '#camel_order' do
      it 'returns an empty array' do
        expect(tile.camel_order).to be_empty
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

    describe '#camel_stack?' do
      it 'returns false' do
        expect(tile).not_to be_camel_stack
      end
    end

    describe '#camel_order' do
      it 'returns an empty array' do
        expect(tile.camel_order).to be_empty
      end
    end
  end

  context 'when "camel_stack"' do
    let(:red_camel) { CamelUpCalculator::GameComponents::Camel.new(:red) }
    let(:blue_camel) { CamelUpCalculator::GameComponents::Camel.new(:blue) }
    let(:camel_stack) { CamelUpCalculator::GameComponents::CamelStack.new([red_camel, blue_camel]) }
    let(:tile) { described_class.new(:camel_stack, camel_stack) }

    describe '#oasis?' do
      it 'returns false' do
        expect(tile).not_to be_oasis
      end
    end

    describe '#desert?' do
      it 'returns false' do
        expect(tile).not_to be_desert
      end
    end

    describe '#camel_stack?' do
      it 'returns true' do
        expect(tile).to be_camel_stack
      end
    end

    describe '#camel_order' do
      it 'returns camels in the correct order' do
        expect(tile.camel_order).to eq([blue_camel, red_camel])
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