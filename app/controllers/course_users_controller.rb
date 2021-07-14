class CourseUsersController < ApplicationController
  before_action :load_course_user, only: [:show]

  def index
    @course_users = current_user.course_users.page(params[:page]).per(Settings.page.per)
    @course_users = @course_users.includes :course
  end

  def show
    @course = @course_user.course
  end

  private

  def load_course_user
    @course_user = current_user.course_users.find_by id: params[:id]
    return if @course_user.present?

    flash[:danger] = t :flash_danger_c_course_users
    redirect_to root_path
  end
end
