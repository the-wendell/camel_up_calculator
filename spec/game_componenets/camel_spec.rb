require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::Camel do
  let(:camel) { described_class.new(:blue) }

  it 'has a color' do
    expect(camel.color).to eq(:blue)
  end

  it '#==' do
    expect(camel).to eq(described_class.new(:blue))
  end
end
