class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success 
    @course = Course.find(params[:courseId])
  end 

  def webhook
    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    course_id = payment.metadata.course_id
    user_id = payment.metadata.user_id

    # p "course id " + course_id
    # p "user id " + user_id

    head 200
  end

  def get_stripe_id
      @course = Course.find(params[:id])
      session_id = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
          name: @course.title,
          description: @course.description,
          amount: @course.price * 100,
          currency: 'aud',
          quantity: 1,
        }],
        payment_intent_data: {
          metadata: {
            user_id: current_user.id,
            course_id: @course.id
          }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&courseId=#{@course.id}",
        cancel_url: "#{root_url}courses"
      ).id
      render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  end
end
