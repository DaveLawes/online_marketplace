require 'item'

describe Item do

  subject { described_class.new(1, 'chair', 9.2) }

  it 'returns the product code' do
    expect(subject.product_code).to eq 1
  end

  it 'returns the name' do
    expect(subject.name).to eq 'chair'
  end

end
