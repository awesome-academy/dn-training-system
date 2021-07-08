class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def index
    @courses = Course.all
  end

  def show; end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = t("course.create_course_success")
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
      if @course.update(course_params)
        flash[:success] = t("course.create_course_success")
        redirect_to courses_path
      else
        render :edit
      end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
      redirect_to courses_path
  end

  private
  def course_params
    params.require(:course)
          .permit(:name, :description, :start_date, :due_date)
  end
end
