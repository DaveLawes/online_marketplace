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

    context 'given promotional_rules' do
      let(:promotional_rules) { double PromotionalRules }
      subject { described_class.new(promotional_rules) }

      it 'calculates the correct total price' do
        subject.scan(item)
        subject.scan(item)

        expect(subject.total).to eq '£16.50'
      end
    end
  end

end
