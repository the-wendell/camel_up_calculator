module CamelUpCalculator
  module GameComponents
    class Die
      attr_reader :color, :value

      def initialize(color, value)
        @color = color
        @value = value
      end
    end
  end
end
