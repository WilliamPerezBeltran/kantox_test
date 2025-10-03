# frozen_string_literal: true

require_relative '../lib/price_policy'

RSpec.describe PricePolicy do
  let(:block) { ->(items) { items.size * 2 } } 
  let(:policy) { PricePolicy.new('PR1', &block) }

  describe '#assigned_to?' do
    it 'returns true if the code matches' do
      expect(policy.assigned_to?('PR1')).to be true
    end

    it 'returns false when codes don’t match' do
      expect(policy.assigned_to?('PR2')).to be false
    end
  end

  describe '#call' do    
    it 'executes calculate_rule block and returns the outcome' do
      items = [1, 2, 3]
      expect(policy.call(items)).to eq(6)  
    end
  end
end
