module ApplicationHelper

  def format_price(price)
  ("<span class='price'>" + number_to_currency(price) + "</span>").html_safe
  end

end
