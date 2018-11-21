require 'promotional_rules'

describe PromotionalRules do

  let(:item) { Item.new(1, 'chair', 9.25) }
  # let(:item) { double Item, price: 9.25 }
  let(:mapped_basket) { { item => 2 } }

  describe '#change_unit_price' do
    context 'given the quantity exceeds the specified amount' do

      it 'updates the unit price' do
        subject.change_unit_price(mapped_basket)
        expect(item.price).to eq 8.5
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
