module ApplicationHelper

  def format_price(price)
    ("<span>" + number_to_currency(price) + "</span>").html_safe
  end

  def add_photo(photo)
    ("<img src=assets/images/" + (photo) + "/200/150 />").html_safe
  end

end
