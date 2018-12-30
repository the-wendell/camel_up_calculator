module CamelUpCalculator
  module Services
    class PlayTurn < Base
      include Wisper::Publisher

      def initialize(board, die, value, pyramid)
        @board = board.copy
        @die = die
        @value = value
        @pyramid = pyramid.copy
      end

      def call
        OpenStruct.new(
          board: move_camel,
          pyramid: roll_die
        )
      end

      private

      def roll_die
        pyramid.roll_die(die)
      end

      def move_camel
        board.move_camel(die.color, value)
      end

      attr_reader :board, :die, :value, :pyramid
    end
  end
end