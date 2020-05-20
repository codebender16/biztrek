module CoursesHelper

  def image_for(course)
    if course.image.present?
        course.image
    else
      'biztrek_default.jpg'
    end
    
  end

  def purchased_courses(course) 
    # current_user.purchased_courses.exists?
    Order.where(user_id: current_user.id, course_id: course.id).exists?

  end

  # def check_purchased_courses(orders, course_id)
  #   if !orders.empty?
  #       orders.each do |course|
  #         if course.course_id == course_id
  #           return true
  #         end
  #       end
  #     end
  #   else
  #     return true
  #   end

end
