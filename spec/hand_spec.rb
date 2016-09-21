require 'hand'
require 'rspec'

describe Hand do
  subject(:hand) { Hand.new }

  describe '#initialize' do
    it 'sets @hand to an empty array' do
      expect(hand.hand).to eq([])
    end
  end

  
end
