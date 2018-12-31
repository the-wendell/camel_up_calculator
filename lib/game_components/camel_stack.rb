module CamelUpCalculator
  module GameComponents
    class CamelStack
      def initialize(camels = [])
        @camels = camels
      end

      def add_to_top_of_stack(camel_stack)
        camels.push(camel_stack.stack).flatten!
      end

      def add_to_bottom_of_stack(camel_stack)
        camels.unshift(camel_stack.stack).flatten!
      end

      def stack
        camels
      end

      def camel_order
        camels.reverse
      end

      def empty?
        camels.empty?
      end

      def get_stack_for_camel!(camel)
        return :camel_not_in_stack unless camels.include?(camel)

        CamelStack.new(stack_for(camel))
      end

      private

      attr_accessor :camels

      def stack_for(camel)
        index = camels.find_index(camel)

        camels.slice!(index, camels.length)
      end
    end
  end
end