module CamelUpCalculator
  module GameComponents
    class Die
      attr_reader :color, :type

      def initialize(color, type)
        @color = color
        @type = type
      end

      def possible_values
        case type
        when :standard
          STANDARD_DIE_VALUES
        when :bonus
          BONUS_DIE_VALUES
        else
          raise ArgumentError, "#{type} is an invalid die type"
        end
      end
    end
  end
end
