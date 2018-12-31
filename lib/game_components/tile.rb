module CamelUpCalculator
  module GameComponents
    class Tile
      attr_reader last_tile

      def initialize(type = :camel_stack, camel_stack = nil, finish_line = false)
        @type = type
        @camel_stack = camel_stack
        @finish_line = finish_line

        validate_type
        create_empty_camel_stack
      end

      def copy
        if camel_stack?
          Tile.new(type, camel_stack.copy)
        else
          Tile.new(type)
        end
      end

      def desert?
        type == :desert
      end

      def oasis?
        type == :oasis
      end

      def camel_stack?
        type == :camel_stack
      end

      def get_camel_stack_for(camel)
        camel_stack.get_stack_for_camel!(camel)
      end

      def camel_order
        return [] unless camel_stack?

        camel_stack.camel_order
      end

      def add_to_top_of_stack(camel)
        camel_stack.add_to_top_of_stack(camel)
      end

      def add_to_bottom_of_stack(camel)
        camel_stack.add_to_bottom_of_stack(camel)
      end

      private

      attr_reader :type
      attr_accessor :camel_stack

      def create_empty_camel_stack
        return unless camel_stack.nil? && camel_stack?

        self.camel_stack = CamelStack.new
      end

      def validate_type
        return if TILE_TYPES.include?(type)

        raise ArgumentError, "#{type} is an invalid Tile type"
      end
    end
  end
end