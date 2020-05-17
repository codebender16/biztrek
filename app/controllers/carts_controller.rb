class CartsController < ApplicationController

  def index
    if user_signed_in? && current_user.cart && current_user.is_student?
      @cart = current_user.cart.courses
    else  
      redirect_to courses_path
    end
  end

  def create # add course into cart 
    if current_user.is_student? && !current_user.cart
      @cart = current_user.create_cart
    end
  end


end
