class OrdersController < ApplicationController
  def index
    orders = Order.all.where(user_id: current_user.id)

    @courses = orders.map do |order|
      Course.find(order.course_id)
    end
    # raise
  end
end
