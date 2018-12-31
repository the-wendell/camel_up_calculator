module CamelUpCalculator
  module GameComponents
    class Camel
      attr_reader :color

      def initialize(color)
        @color = color
      end

      def ==(other)
        return unless other.respond_to?(:color)

        color == other.color
      end
    end
  end
end