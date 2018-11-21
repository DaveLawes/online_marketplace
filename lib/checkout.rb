class Checkout

  def initialize(promotional_rules = nil)
    @basket = []
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @basket.push(item)
  end

  def total
    mapped_basket = @basket.each_with_object(Hash.new(0)) { |k, v| v[k] += 1 }
    if @promotional_rules.nil?
      total = calculate_total(mapped_basket)
    else
      @promotional_rules.change_unit_price(mapped_basket)
      total = calculate_total(mapped_basket)
    end
    pretty_print_total(total)
  end

  private

  def calculate_total(mapped_basket)
    total = 0
    mapped_basket.each do |item, quantity|
      total += item.price * quantity
    end
    total
  end

  def pretty_print_total(total)
    "£#{sprintf('%.2f', total)}"
  end

end
