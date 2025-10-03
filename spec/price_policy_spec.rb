# frozen_string_literal: true

require_relative '../lib/price_policy'

RSpec.describe PricePolicy do
  let(:block) { ->(items) { items.size * 2 } } 
  let(:policy) { PricePolicy.new('PR1', &block) }

  describe '#initialize' do
    it 'stores the calculation block in calculate_rule' do
      expect(policy.calculate_rule).to be_a(Proc)
    end

    it 'allows initialize without a block' do
      expect { PricePolicy.new('PR2') }.not_to raise_error
    end
  end

  describe '#assigned_to?' do
    it 'returns true if the code matches' do
      expect(policy.assigned_to?('PR1')).to be true
    end

    it 'returns false when codes do not match' do
      expect(policy.assigned_to?('PR2')).to be false
    end

    it 'is case-sensitive' do
      expect(policy.assigned_to?('pr1')).to be false
    end

    it 'returns false when product_code is nil' do
      expect(policy.assigned_to?(nil)).to be false
    end
  end

  describe '#call' do    
    it 'raises an error if no block was given at initialization' do
      policy = PricePolicy.new('PR1')
      items = [1, 2, 3]

      expect { policy.call(items) }.to raise_error(NoMethodError)
    end

    it 'returns 0 if items is empty' do
      items = []
      expect(policy.call(items)).to eq(0)
    end

    it 'executes calculate_rule block and returns the outcome' do
      items = [1, 2, 3]
      expect(policy.call(items)).to eq(6)  
    end

    context 'edge cases' do
      it 'works when items is nil if block handles it' do
        policy = PricePolicy.new('PR1') { |items| items.nil? ? 0 : items.size }
        expect(policy.call(nil)).to eq(0)
      end

      it 'raises an exception if a nil is passedl' do
        expect { policy.call(nil) }.to raise_error(NoMethodError)
      end
    end
  end
end
