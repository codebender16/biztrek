class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # show all courses
  def index
    @courses = Course.with_attached_image.all
  end

  # show selected course
  def show
  end

  # this is where user is sent to course creation form
  def new
    @course = Course.new
  end

  # create and save course into database if inputs are valid
  def create
    @course = current_user.courses.create(course_params)

    if @course.errors.any?
      render :new
    else
      @course.save
      flash[:success] = "You successfully created a new listing!"
      redirect_to @course
    end
  end

  def edit
  end

  # updates course information
  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  # delete a course from database
  def destroy
    @course.destroy
    redirect_to courses_path
    flash[:notice] = "#{@course.title} has been deleted"
  end

  private
  # sanitises user inputs in course creation form
  def course_params
    params.require(:course).permit(:title, :sub_title, :description, :price, :image)
  end

  # refactor course finding by id code from above into the below method to run before any action
  # this save lines of code and keep the code DRY
  def set_course
    @course = Course.find_by_id(params[:id])

    if @course == nil
      redirect_to courses_path
      flash[:alert] = "Sorry, the course you are looking for doesn't exist"
    end
  end
end
