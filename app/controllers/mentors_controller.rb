class MentorsController < ApplicationController
  # shows all the courses created by a mentor
  def index
    @courses = Course.where(user_id: current_user.id)
  end
end
