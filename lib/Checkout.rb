class Checkout

  def initialize
    @basket = []
  end

  def scan(item)
    @basket.push(item)
  end

  def total
    total = 0
    @basket.each do |item|
      total += item.price
    end
    "£#{sprintf('%.2f', total)}"
  end

end
