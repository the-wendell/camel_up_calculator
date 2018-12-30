require "camel_up_calculator/version"
require 'require_all'
require 'ostruct'
require_relative 'game_constants'
require_rel 'game_components'

module CamelUpCalculator
  def calculate_odds_for_round(positions_hash, unrolled_dice: build_all_dice)
    score_board = GameComponents::ScoreBoard.new
    Wisper.subscribe(score_board)

    Services::RoundManager.call(positions_hash, unrolled_dice)

    score_board
  end

  private

  def build_all_dice
    COLORS.map do |die_color|
      GameComponents::Die.new(die_color)
    end
  end
end
