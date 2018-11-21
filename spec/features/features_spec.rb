require 'checkout'

describe 'Features' do

  let(:co) { Checkout.new }
  let(:item1) { Item.new(1, 'Very cheap chair', 9.25) }
  let(:item2) { Item.new(2, 'Little table', 45) }
  let(:item3) { Item.new(3, 'Funky light', 19.95) }
  let(:promotional_rules) { PromotionalRules.new }

  describe 'Checkout evaluates total price of basket' do
    context 'given no promotional rules' do

      it 'calculates the total price correctly' do
        co.scan(item1)
        co.scan(item2)
        co.scan(item3)

        expect(co.total).to eq '£74.20'
      end

    end

    context 'given promotional rules' do

      let(:co) { Checkout.new(promotional_rules) }

      it 'calculates the correct total' do
        co.scan(item1)
        co.scan(item2)
        co.scan(item3)

        expect(co.total).to eq '£66.78'
      end

    end
  end

end
