module CoursesHelper

  # check for image presence and ensure default image is used if necessary
  def image_for(course)
    if course.image.present?
      course.image
    else
      'biztrek_default.jpg'
    end
  end

  # this checks if user has already purchased the course
  # if they have, hide add to cart button
  def purchased_courses(course)
    Order.where(user_id: current_user.id, course_id: course.id).exists?
  end

end
