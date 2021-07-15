class CoursesController < ApplicationController
  before_action :load_course, only: [:show, :edit, :update]
  before_action :list_subjects, only: [:new, :edit, :create, :update]

  def new
    @course = Course.new
  end

  def index
    @courses = Course.last_course.page(params[:page])
                     .per(Settings.courses_per_page)
  end

  def show
    @subjects = @course.subjects.last_subject.page(params[:page]).per(Settings.subject_per_page)

    flash[:danger] = t "course.course_not_subject" if @subjects.empty?
  end

  def create
    @course = Course.new course_params
    if @course.save

      flash[:success] = t "course.create_course_success"
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @subjects = Subject.select :id, :name_subject
  end

  def update
    render :edit unless @course.update course_params

    flash[:success] = t "course.update_course_success"
    redirect_to @course
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :start_date, :due_date,
                                   :status, subject_ids: [], course_subjects_attributes: [:id, :course_id,
     :subject_id, :status])
  end

  def list_subjects
    @subjects = Subject.pluck(:name_subject, :id)
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course

    flash[:danger] = t "course.course_not_find"
    redirect_to courses_path
  end
end
