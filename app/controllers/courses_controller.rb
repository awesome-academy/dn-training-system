class CoursesController < ApplicationController
  before_action :list_subjects, only: [:new]

  def new
    @course = Course.new
  end

  def index
    @courses = Course.last_course.page(params[:page])
                     .per(Settings.courses_per_page)
  end

  def show
    @course = Course.find_by id: params[:id]
    @subjects = @course.subjects.page(params[:page]).per(Settings.subject_per_page)
  end

  def create
    @course = Course.new course_params
    if @course.save

      flash[:success] = t("course.create_course_success")
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find_by id: params[:id]
    @subjects = Subject.all
  end

  def update
    @course = Course.find_by id: params[:id]
    if @course.update course_params

      flash[:success] = t("course.update_course_success")
      redirect_to @course
    else
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :start_date, :due_date,
     :status, subject_ids: [], course_subjects_attributes:[:id, :course_id,
     :subject_id, :status])
  end

  def list_subjects
    @subjects = Subject.pluck(:name_subject, :id)
  end
end
