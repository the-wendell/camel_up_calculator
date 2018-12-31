module CamelUpCalculator
  module Services
    class RoundManager < Base
      include Wisper::Publisher

      def initialize(board, pyramid)
        @board = board
        @pyramid = pyramid
      end

      def call
        pyramid.unrolled_dice.each do |die|
          simulate_all_possible_rolls_for(die)
        end

        broadcast(:race_completed, board) if pyramid.unrolled_dice.empty?
      end

      private

      attr_reader :pyramid, :board

      def simulate_all_possible_rolls_for(die)
        die.possible_values.each do |value|
          PlayTurn.call(board, die, value, pyramid)
                  .yield_self { |last_turn| play_next_turn(last_turn) }
        end
      end

      def play_next_turn(last_turn)
        RoundManager.call(last_turn.board, last_turn.pyramid)
      end
    end
  end
end