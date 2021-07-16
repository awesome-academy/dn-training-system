class CourseUsersController < ApplicationController
  before_action :load_subject, only: :show_tasks
  before_action :load_user_course_subject, only: :show_tasks
  before_action :load_course_user, only: [:show, :show_tasks]

  def index
    @course_users = current_user.course_users.includes(:course)
                                .page(params[:page]).per(Settings.page.per)
  end

  def show
    @course = @course_user.course
    @user_course_subjects = @course_user.user_course_subjects
                                        .includes course_subject: [:subject]
    flash.now[:warning] = t(:not_have_subject) unless @user_course_subjects.any?
  end

  def show_tasks
    @tasks = @subject.tasks
    @user_tasks = @user_course_subject.user_tasks
    return if @tasks.present? && @user_tasks.present?

    flash.now[:warning] = t :not_found_task
  end

  private

  def load_course_user
    @course_user = current_user.course_users.find_by course_id: params[:course_id], user_id: params[:user_id]
    return if @course_user

    flash[:danger] = t :flash_danger_c_course_users
    redirect_to course_users_path
  end

  def load_subject
    @subject = Subject.find_by(id: params[:subject_id])
    return if @subject

    flash[:danger] = t :not_found_subject
    redirect_to course_users_path
  end
  
  def load_user_course_subject
    @user_course_subject = UserCourseSubject.find_by(id: params[:id])
    return if @user_course_subject

    flash[:danger] = t :not_found_user_course_subject
    redirect_to course_users_path
  end
end
