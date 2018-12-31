module CamelUpCalculator
  module GameComponents
    class Pyramid
      attr_reader :unrolled_dice

      def initialize(dice_array)
        @unrolled_dice = dice_array
      end

      def roll_die(die)
        Pyramid.new(
          unrolled_dice.reject { |d| d == die }
        )
      end

      private

      attr_writer :unrolled_dice
    end
  end
end
