describe 'Feature: No Promotions' do

  let(:co) { Checkout.new }
  let(:item1) { Item.new(1, 'Very cheap chair', 9.25) }
  let(:item2) { Item.new(2, 'Little table', 45) }
  let(:item3) { Item.new(3, 'Funky light', 19.95) }

  describe 'Checkout returns total price of basket' do

    it 'calculates the total price correctly' do
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)

      expect(co.total).to eq '£74.20'
    end

  end

end
