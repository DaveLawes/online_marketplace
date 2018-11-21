class PromotionalRules

  def change_unit_price(mapped_basket)
    mapped_basket.each do |item, quantity|
      item.price = 8.5 if quantity >=2
    end
    mapped_basket
  end

  def apply_discount(total)
    total = total * (1 - 0.1) if total > 60
    total
  end

end
