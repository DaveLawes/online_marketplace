class Checkout

  def initialize(promotional_rules = nil)
    @basket = []
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @basket.push(item)
  end

  def total
    return calculate_total if @promotional_rules.nil?
  end

  private

  def calculate_total
    total = 0
    @basket.each do |item|
      total += item.price
    end
    "£#{sprintf('%.2f', total)}"
  end

end
