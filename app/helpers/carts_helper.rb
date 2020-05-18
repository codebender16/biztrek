module CartsHelper
  
  def total(cart)
    total = 0
    cart.each do |course|
      total += (course.price * 1)
    end
    return total
  end
  
end
