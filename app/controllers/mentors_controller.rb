class MentorsController < ApplicationController
  def index
    @courses = Course.where(user_id: current_user.id)
  end
end
