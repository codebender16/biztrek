class CartsController < ApplicationController

  # to show all cart items
  def index
    if user_signed_in? && current_user.cart && current_user.is_student?
      @cart = current_user.cart.courses
    else  
      redirect_to courses_path
    end
  end

  # total items in the cart
  def total_items
    @total_items = current_user.cart.courses.count
  end

  # total price in the cart? if Harrison/Eddie does not approve having it in the helper

  # add course into cart 
  def create 
    if current_user.is_student? && !current_user.cart
      @cart = current_user.create_cart
    else
      @cart = current_user.cart
    end

    @course = Course.find(params[:course_id]) # why cant we pass an object here instead, for eg) @course.id
    @cart.courses << @course
    flash[:success] = "Successfully added #{@course.title} to cart"

    redirect_to courses_path
    
  end

  # error - no route matches DELETE /carts
  # currently there is no ID to track, that is why, there is no route matching with delete. need to find a way
  def destroy # if i use @course, will it destroy the original course as well?
    @course = Cart.find(params[:course_id])
    @course.destroy 

    redirect_to carts_path
  end


end
