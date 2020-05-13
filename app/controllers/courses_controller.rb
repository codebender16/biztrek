class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  load_and_authorize_resource
  
  def index
    @courses = Course.all
  end

end
