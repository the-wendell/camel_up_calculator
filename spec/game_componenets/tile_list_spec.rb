require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::TileList do
  let(:tile_1) { CamelUpCalculator::GameComponents::Tile.new }
  let(:tile_2) { CamelUpCalculator::GameComponents::Tile.new }
  let(:tile_3) { CamelUpCalculator::GameComponents::Tile.new }
  let(:tile_list) { described_class.new([tile_1, tile_2, tile_3]) }

  describe '#create_or_get_tile' do
    context 'when tile does not exist' do
      it 'returns the correct tile' do
        expect(tile_list.instance_variable_get(:@tiles).length).to eq(3)
        expect(tile_list.create_or_get_tile(2)).to eq(tile_3)
        expect(tile_list.instance_variable_get(:@tiles).length).to eq(3)
      end
    end

    context 'when tile does exist' do
      it 'returns a newley created tile' do
        expect(tile_list.instance_variable_get(:@tiles).length).to eq(3)
        expect(tile_list.create_or_get_tile(4)).to be_camel_stack
        expect(tile_list.instance_variable_get(:@tiles).length).to eq(5)
      end
    end
  end

  describe '#find' do
    context 'when tile does not exist' do
      it 'returns nil' do
        expect(tile_list.find(4)).to be_nil
      end
    end

    context 'when tile does exist' do
      it 'returns the tile' do
        expect(tile_list.find(2)).to eq(tile_3)
      end
    end
  end
end