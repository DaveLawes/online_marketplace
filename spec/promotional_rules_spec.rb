require 'promotional_rules'

describe PromotionalRules do
  let(:item) { double :item_double, price: 9.25, product_code: 1 }
  let(:mapped_basket) { { item => 2 } }
  let(:unit_quantities) { { 1 => 2 } }
  let(:unit_prices) { { 1 => 8.5 } }

  subject { described_class.new(60, 0.1, unit_quantities, unit_prices) }

  describe '#change_unit_price' do
    context 'given the quantity exceeds the specified amount' do

      it 'updates the unit price' do
        expect(item).to receive(:price=).with(8.5)
        subject.change_unit_price(mapped_basket)
      end

    end
  end

  describe '#apply_discount' do
    context 'given total is greater than specified cap' do

      it 'applies the percentage discount to the total' do
        expect(subject.apply_discount(100)).to eq 90
      end

    end

    context 'given total is less than specified cap' do

      it 'does not apply the percentage discount to the total' do
        expect(subject.apply_discount(55)).to eq 55
      end

    end
  end

end
