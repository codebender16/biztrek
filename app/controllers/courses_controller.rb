class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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
    # if current_user.is_admin? # in the future will need to create a different form for admin to create
    #   @course = current_user.create_mentor.courses.create(course_params)
    # elsif current_user.is_mentor?
    #   @course = current_user.mentor.courses.create(course_params)
    # end
    #########
    @course = current_user.mentor.courses.create(course_params)


    if @course.errors.any?
      render :new
    else
      @coure.save
      flash[:success] = "You successfully created a new listing!"
      redirect_to @course
    end 

    # if @course.save
    #   redirect_to @course
    # else
    #   render :new
    # end

  end

  def edit
  end

  def update
  
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end

  end

  def destroy
    
    @course.destroy
    redirect_to courses_path
    flash[:notice] = "#{@course.title} has been deleted"
  end


  private

    def course_params
      params.require(:course).permit(:title, :sub_title, :description, :price, :image)
    end

    def set_course
      @course = Course.find_by_id(params[:id])

      if @course == nil
        redirect_to courses_path
        flash[:alert] = "Sorry, the course you are looking for doesn't exist"
      end
    end


end
