class CourseUsersController < ApplicationController
  before_action :load_course_user, only: :show

  def index
    @course_users = current_user.course_users.includes(:course)
                                .page(params[:page]).per(Settings.page.per)
  end

  def show
    @course = @course_user.course
    @user_course_subjects = @course_user.user_course_subjects
                                        .includes course_subject: [:subject]
    flash.now[:danger] = t(:not_have_subject) unless @user_course_subjects.any?
  end

  private

  def load_course_user
    @course_user = current_user.course_users.find_by course_id: params[:course_id], user_id: params[:user_id]
    return if @course_user

    flash[:danger] = t :flash_danger_c_course_users
    redirect_to course_users_path
  end
end
