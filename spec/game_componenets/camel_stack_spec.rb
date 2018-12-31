require 'spec_helper'

RSpec.describe CamelUpCalculator::GameComponents::CamelStack do
  let(:red_camel) { CamelUpCalculator::GameComponents::Camel.new(:red) }
  let(:blue_camel) { CamelUpCalculator::GameComponents::Camel.new(:blue) }
  let(:yellow_camel) { CamelUpCalculator::GameComponents::Camel.new(:yellow) }
  let(:stack1) { described_class.new([red_camel, blue_camel]) }
  let(:stack2) { described_class.new([yellow_camel]) }

  describe '#add_to_top_of_stack' do
    it 'adds another camel stack to the top of its self' do
      stack1.add_to_top_of_stack(stack2)
      expect(stack1.stack).to eq([red_camel, blue_camel, yellow_camel])
    end
  end

  describe '#add_to_bottom_of_stack' do
    it 'adds another camel stack to the bottom of its self' do
      stack1.add_to_bottom_of_stack(stack2)
      expect(stack1.stack).to eq([yellow_camel, red_camel, blue_camel])
    end
  end

  describe '#stack' do
    it 'returns the stack of camels' do
      expect(stack1.stack).to eq([red_camel, blue_camel])
    end
  end

  describe '#camel_order' do
    it 'returns the camels in order from first place to last' do
      expect(stack1.camel_order).to eq([blue_camel, red_camel])
    end
  end

  describe '#empty?' do
    it 'returns true if the stack is empty' do
      stack = described_class.new
      expect(stack).to be_empty
    end

    it 'returns false if the stack is not empty' do
      expect(stack1).not_to be_empty
    end
  end

  describe '#get_stack_for_camel!' do
    let(:camel_stack) { described_class.new([red_camel, blue_camel, yellow_camel]) }

    it 'returns the stack for a specific camel' do
      stack = camel_stack.get_stack_for_camel!(blue_camel)
      expect(stack.stack).to eq([blue_camel, yellow_camel])
    end

    it 'removes the returned stack from itselft' do
      camel_stack.get_stack_for_camel!(blue_camel)
      expect(camel_stack.stack).to eq([red_camel])
    end

    it 'returns :camel_not_in_stack if camel is not present' do
      expect(stack1.get_stack_for_camel!(yellow_camel)).to eq(:camel_not_in_stack)
    end
  end
end