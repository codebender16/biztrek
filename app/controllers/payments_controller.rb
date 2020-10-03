class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  # shows order history for a student if payment is successful
  def success
    @courses = current_user.purchased_courses.order(created_at: :desc)
  end

  # respond back to biztrek app when payment has been made through Stripe
  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    course_ids = payment.metadata.course_id
    user_id = payment.metadata.user_id

    # add user purchases to order history and empties user's cart
    cart = User.find(user_id).cart
    cart.carts_courses.each do |course|
      Order.create(user_id: user_id, course_id: course.course_id)

      course.destroy
    end
    head 200
  end

  # send courses details to stripe to be purchased_courses
  # directs user to success page after checkout
  def get_stripe_id
    @courses = current_user.cart.courses

    line_items = @courses.map do |course|
      {
        name: course.title,
        description: course.description,
        amount: course.price * 100,
        currency: 'aud',
        quantity: 1
      }
    end

    course_ids = @courses.pluck(:id).join(",")

    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: line_items,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          course_id: course_ids
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&courseIds=#{course_ids}",
      cancel_url: "#{root_url}courses"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
  end
end
