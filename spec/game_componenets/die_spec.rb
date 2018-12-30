require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::Die do
  let(:die) { described_class.new(:blue, 3) }

  it 'has a color' do
    expect(die.color).to eq(:blue)
  end

  it 'has a value' do
    expect(die.value).to eq(3)
  end
end