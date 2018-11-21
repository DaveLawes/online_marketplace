require 'item'

describe Item do

  subject { descrbed_class.new(1, 'chair', 9.25) }

  it 'returns the product code' do
    expect(subject.product_code).to eq 1
  end

end
