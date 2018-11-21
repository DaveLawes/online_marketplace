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

end
