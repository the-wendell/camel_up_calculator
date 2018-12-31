module CamelUpCalculator
  module GameComponents
    class Board
      def initialize(tile_list)
        @tiles = tile_list
      end

      def positions
        results = OpenStruct.new

        
      end

      def move_camel(color, spaces)
        camel_stack_and_current_position(Camel.new(color))
          .yeild_self { |result| move_stack_to_tile(result.stack, result.tile_number) }
      end

      def copy
        Board.new(tile_list.copy)
      end

      private

      attr_reader :tiles

      def move_stack_to_tile(stack, tile_number)
        determine_move(tile_number)
          .yeild_self do |results|
            if results == :finish_line_crossed
              :finish_line_crossed
            elsif results.top_of_stack
              results.tile.add_to_top_of_stack(stack) 
            else
              results.tile.add_to_bottom_of_stack(stack)
            end
          end
      end

      def determine_move(tile_number)
        tile = get_target_tile(tile_number)
        results = tile ? OpenStruct.new(tile: tile, top_of_stack: true) : :finish_line_crossed

        if tile.desert?
          results.tile = tiles.find(tile_number - 1)
          results.top_of_stack = false
        elsif tile.oasis?
          results.tile = tiles.create_or_get_tile(tile_number + 1)
        end

        results
      end

      def get_target_tile(tile_number)
        tiles.find(tile_number) ||
          if finish_line_crossed?
            nil
          else
            tile.create_or_get_tile(tile_number)
          end
      end

      def finish_line_crossed?
        tiles.last.finish_line
      end

      def camel_stack_and_current_position(camel)
        tiles.each_with_index do |tile, index|
          s = tile.get_camel_stack_for(camel)

          unless s == :camel_not_in_stack
            return OpenStruct.new(stack: s, tile_number: index)
          end
        end
      end
    end
  end
end