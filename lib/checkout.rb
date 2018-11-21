class Checkout

  def initialize(promotional_rules = nil)
    @basket = []
    @total = 0
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @basket.push(item)
  end

  def total
    mapped_basket = @basket.each_with_object(Hash.new(0)) { |k, v| v[k] += 1 }
    @promotional_rules.nil? ? calculate_total(mapped_basket) : apply_rules(mapped_basket)
    pretty_print_total
  end

  private

  def calculate_total(mapped_basket)
    mapped_basket.each { |item, quantity| @total += item.price * quantity }
  end

  def pretty_print_total
    "£#{sprintf('%.2f', @total)}"
  end

  def apply_rules(mapped_basket)
    @promotional_rules.change_unit_price(mapped_basket)
    calculate_total(mapped_basket)
    @total = @promotional_rules.apply_discount(@total)
  end

end
