class PromotionalRules

  def initialize(spend_over, discount, unit_quantities, unit_prices)
    @spend_over = spend_over
    @discount = discount
    @unit_quantities = unit_quantities
    @unit_prices = unit_prices
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
    @unit_quantities.each do |product_code, quantity_threshold|
      if item.product_code == product_code && quantity >= quantity_threshold
        p item.price
        item.price = @unit_prices[item.product_code]
      end
    end
  end

end
