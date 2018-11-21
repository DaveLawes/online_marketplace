class PromotionalRules

  def initialize
    @spend_over = 60
    @discount = 0.1
    @unit_quantities = { 1 => 2 }
    @unit_prices = { 1 => 8.5 }
  end

  def change_unit_price(mapped_basket)
    mapped_basket.each { |item, quantity| update_price(item, quantity) }
  end

  def apply_discount(total)
    total *= (1 - @discount) if total > @spend_over
    total
  end

  private

  def update_price(item, quantity)
    @unit_quantities.each do | product_code, quantity_threshold |
      if item.product_code == product_code && quantity >= quantity_threshold
        item.price = @unit_prices[item.product_code]
      end
    end
  end

end
