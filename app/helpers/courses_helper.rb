module CoursesHelper

    def image_for(course)
    if course.image.present?
        course.image
    else
      'biztrek_default.jpg'
    end
  end

end
