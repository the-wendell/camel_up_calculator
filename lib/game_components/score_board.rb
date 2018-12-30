module CamelUpCalculator
  module GameComponents
    class ScoreBoard
      def initialize
        COLORS.each do |color|
          instance_variable_set("@#{color}", blank_score_board)
        end
      end

      attr_reader(*COLORS)

      def race_completed(results)
        add_results(results)
      end

      def total_number_of_races
        COLORS.reduce(0) do |sum, color|
          sum + instance_variable_get("@#{color}")[:first]
        end
      end

      def all_odds_for(color)
        PLACES.each_with_object({}) do |place, hash|
          hash[place] = odds_for(color, place)
        end
      end

      def odds_for(color, place)
        (instance_variable_get("@#{color}")[place] / total_number_of_races).round(2)
      end

      private

      def add_results(results)
        COLORS.each do |color|
          update_results_for(color, results.send(color))
        end
      end

      def update_results_for(color, position)
        new_score_board = instance_variable_get("@#{color}").dup

        new_score_board[position] += 1

        instance_variable_set("@#{color}", new_score_board)
      end

      def blank_score_board
        PLACES.each_with_object({}) do |place, hash|
          hash[place] = 0.0
        end
      end
    end
  end
end