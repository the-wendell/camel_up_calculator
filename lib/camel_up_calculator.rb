require "camel_up_calculator/version"
require 'require_all'
require 'ostruct'
require_relative 'game_constants'
require_rel 'game_components'

module CamelUpCalculator
  def calculate_odds_for_round(positions_array, unrolled_dice = nil)
    if unrolled_dice.nil?
      unrolled_dice = build_all_dice(positions_array)
                      .yield_self { |dice| add_last_place_die(dice, positions_array) }
    end

    score_board = GameComponents::ScoreBoard.new
    Wisper.subscribe(score_board)

    Services::RoundManager.call(
      GameComponents::Board.new(positions_array),
      GameComponents::Pyramid.new(unrolled_dice)
    )

    Wisper.clear
    score_board
  end

  private

  def build_all_dice
    COLORS.map { |die_color| GameComponents::Die.new(die_color, :standard) }
  end

  def add_last_place_die(dice, positions_array)
    
  end
end
