class CartsController < ApplicationController

  # to show all cart items
  def index
    if user_signed_in? && current_user.cart && !current_user.is_mentor?
      @cart_items = cart_items # all items in the cart
      @total_costs = cart_total # total costs of current items in the cart
    else  
      redirect_to courses_path
    end
  end

  # items in the cart
  def cart_items
    current_user.cart.courses
  end

  # sums up the price of all items currently in the cart
  def cart_total
    sum = 0
    @cart_items.each do |course|
      sum += (course.price * 1)
    end
    return sum
  end

  # add course into cart 
  def create 
    unless current_user.is_mentor? && current_user.cart
      @cart = current_user.create_cart
    else
      @cart = current_user.cart
    end

    @course = Course.find(params[:course_id]) # why cant we pass an object here instead, for eg) @course.id
    @cart.courses << @course # this essentially create a joined table 
    flash[:success] = "Successfully added #{@course.title} to cart"

    redirect_to courses_path
    
  end

  # error - no route matches DELETE /carts
  # currently there is no ID to track, that is why, there is no route matching with delete. need to find a way
  def destroy # if i use @course, will it destroy the original course as well?
    @courses = current_user.cart.carts_courses.where(course_id: params[:course_id])
    # raise
    @courses.first.destroy

    redirect_to carts_path
  end


end
