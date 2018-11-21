require 'checkout'

describe Checkout do

  let(:item) {  }

  describe '#scan' do

    it 'adds item to basket' do
      expect(subject.scan(item)).to equal [item]
    end

  end

end
