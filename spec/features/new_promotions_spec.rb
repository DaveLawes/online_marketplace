describe 'Feature: New Promotions' do

  let(:promotional_rules) { PromotionalRules.new(100, 0.15, { 2 => 2 }, { 2 => 44.5 }) }
  let(:co) { Checkout.new(promotional_rules) }
  let(:item1) { Item.new(1, 'Very cheap chair', 9.25) }
  let(:item2) { Item.new(2, 'Little table', 45) }
  let(:item3) { Item.new(3, 'Funky light', 19.95) }

  describe 'Checkout returns total price of basket' do
    # discount of 15% for total > £100
    # new price for 2 or more item 2

    it 'calculates the correct total' do
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)
      co.scan(item2)

      expect(co.total).to eq '£100.47'
    end

  end

end
