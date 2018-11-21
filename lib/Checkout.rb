class Checkout

  def initialize
    @basket = []
  end

  def scan(item)
    @basket.push(item)
  end

end
