class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_course, only: [:show, :edit, :update, :destroy] 
  load_and_authorize_resource
  
  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render :new
    end

  end

  def edit
  end

  def update
    @course = Course.find_by_id[params[:id]]

    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end

  end

  def delete
    @course.destroy

    redirect_to courses_path
  end


  private

    def course_params
      params.require(:course).permit(:title, :sub_title, :description, :price)
    end

    def set_course
      @course = Course.find(params[:id])

      if course == nil
        redirect_to courses_path
        flash[:alert] = "Sorry, the course you are looking for doesn't exist"
      end
    end


end
