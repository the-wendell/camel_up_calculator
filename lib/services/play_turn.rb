module CamelUpCalculator
  module Services
    class PlayTurn < Base
      def initialize(board, die, value, pyramid)
        @board = board.copy
        @die = die
        @value = value
        @pyramid = pyramid
      end

      def call
        OpenStruct.new
                  .yield_self { |turn| move_camel(turn) }
                  .yield_self { |turn| roll_die(turn) }
      end

      private

      attr_reader :board, :die, :value, :pyramid

      def roll_die(turn)
        turn.pyramid = pyramid.roll_die(die)
        turn
      end

      def move_camel(turn)
        board.move_camel(die.color, value)
             .yield_self { |result| add_move_result_to_turn(result, turn) }
      end

      def add_move_result_to_turn(result, turn)
        turn.board = board
        turn.finish_line_crossed = :finish_line_crossed
      end
    end
  end
end