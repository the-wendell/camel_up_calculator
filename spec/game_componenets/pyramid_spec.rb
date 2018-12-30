require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::Pyramid do
  let(:red_die) { CamelUpCalculator::GameComponents::Die.new(:red, 2) }
  let(:blue_die) { CamelUpCalculator::GameComponents::Die.new(:blue, 2) }
  let(:yellow_die) { CamelUpCalculator::GameComponents::Die.new(:yellow, 2) }
  let(:pyramid) { described_class.new([red_die, blue_die, yellow_die]) }

  it 'rolls a die' do
    expect(pyramid.unrolled_dice.count).to eq(3)

    pyramid.roll_die(red_die)

    expect(pyramid.unrolled_dice.include?(red_die)).to be_falsey
    expect(pyramid.rolled_dice.include?(red_die)).to be_truthy
  end
end
