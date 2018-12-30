module CamelUpCalculator
  module GameComponents
    class Die
      attr_reader :color, :value

      def initialize(color, value = nil)
        @color = color
        @value = value
      end

      def rolled?
        !value.nil?
      end

      def roll(value)
        @value = value
      end
    end
  end
end
