module CamelUpCalculator
  module GameComponents
    class Pyramid
      attr_reader :unrolled_dice, :rolled_dice

      def initialize(dice_array)
        @unrolled_dice = dice_array
        @rolled_dice = []
      end

      def roll_die(die)
        @unrolled_dice.delete(die)
        @rolled_dice.push(die)
      end
    end
  end
end
