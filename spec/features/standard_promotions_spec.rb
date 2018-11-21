describe 'Feature: Standard Promotions' do

  let(:promotional_rules) { PromotionalRules.new(60, 0.1, { 1 => 2 }, { 1 => 8.5 }) }
  let(:co) { Checkout.new(promotional_rules) }
  let(:item1) { Item.new(1, 'Very cheap chair', 9.25) }
  let(:item2) { Item.new(2, 'Little table', 45) }
  let(:item3) { Item.new(3, 'Funky light', 19.95) }

  describe 'Checkout returns total price of basket' do

    it 'satisfies test case 1' do
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)

      expect(co.total).to eq '£66.78'
    end

    it 'satisfies test case 2' do
      co.scan(item1)
      co.scan(item3)
      co.scan(item1)

      expect(co.total).to eq '£36.95'
    end

    it 'satisfies test case 3' do
      co.scan(item1)
      co.scan(item2)
      co.scan(item1)
      co.scan(item3)

      expect(co.total).to eq '£73.76'
    end
  end

end
