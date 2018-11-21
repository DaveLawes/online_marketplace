require 'checkout'

describe Checkout do

  let(:item) { double :item, :price => 9.25 }

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
      let(:promotional_rules) { double :promotional_rules,
                                spend_over: 60,
                                discount: 0.1,
                                unit_quantities: { 1 => 2 },
                                unit_prices: { 1 => 8.5 }
      }
      subject { described_class.new(promotional_rules) }

      it 'calculates the correct total price' do
        10.times { subject.scan(item) }
        allow(promotional_rules).to receive(:change_unit_price)
        allow(promotional_rules).to receive(:apply_discount).and_return(76.5)
        allow(item).to receive(:price).and_return(8.5)

        expect(subject.total).to eq '£76.50'
      end
    end
  end

end
