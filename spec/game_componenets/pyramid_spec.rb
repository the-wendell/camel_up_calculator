require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::Pyramid do
  let(:pyramid) { described_class.new(%w[yello red blue orange green white]) }

  it 'rolls a die' do
    expect(pyramid.unrolled_dice.count).to eq(6)

    pyramid.roll_die('red')

    expect(pyramid.unrolled_dice.include?('red')).to be_falsey
    expect(pyramid.rolled_dice.include?('red')).to be_truthy
  end
end
