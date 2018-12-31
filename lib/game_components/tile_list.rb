module CamelUpCalculator
  module GameComponents
    class TileList
      def initialize(tile_array)
        @tiles = tile_array
      end

      def find(tile_number)
        tiles[tile_number]
      end

      def last
        tiles.last
      end

      def create_or_get_tile(tile_number)
        return tiles[tile_number] if tiles[tile_number]

        create_and_return_new_tile(tile_number)
      end

      def copy
        TileList.new(tile_array.map(&:copy))
      end

      private

      attr_accessor :tiles

      def create_and_return_new_tile(tile_number)
        (tile_number + 1 - tiles.length).times do
          tiles.push(Tile.new)
        end
        tiles[tile_number]
      end
    end
  end
end