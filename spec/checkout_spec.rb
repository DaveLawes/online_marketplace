require 'checkout'

describe Checkout do

  let(:item) { double Item }

  describe '#scan' do

    it 'adds item to basket' do
      expect(subject.scan(item)[0]).to equal item
    end

  end

end
