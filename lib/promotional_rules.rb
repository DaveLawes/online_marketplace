class PromotionalRules

  def change_unit_price(mapped_basket)
    mapped_basket.each do |item, quantity|
      if quantity >=2
        item.price = 8.5
      end
    end
    mapped_basket
  end

end
