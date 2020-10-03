class OrdersController < ApplicationController
  # shows all courses purchased by a student
  def index
    orders = Order.all.where(user_id: current_user.id)

    @courses = orders.map do |order|
      Course.find(order.course_id)
    end
    # raise
  end
end
