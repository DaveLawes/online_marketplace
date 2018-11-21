require 'checkout'

describe Checkout do

  let(:item) { double Item, price: 9.25 }

  describe '#scan' do

    it 'adds item to basket' do
      expect(subject.scan(item)[0]).to equal item
    end

  end

  describe '#total' do
    context 'given no promotional_rules' do

      it 'calculates the total price' do
        subject.scan(item)
        subject.scan(item)
        expect(subject.total).to eq '£18.50'
      end

    end
  end

end
