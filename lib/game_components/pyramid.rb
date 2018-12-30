module CamelUpCalculator
  module GameComponents
    class Pyramid
      attr_reader :unrolled_dice

      def initialize(dice_array)
        @unrolled_dice = dice_array
      end

      def roll_die(die)
        unrolled_dice.delete(die)
      end

      def copy
        Pyramid.new(unrolled_dice)
      end

      private

      attr_writer :unrolled_dice
    end
  end
end
