class UserTasksController < ApplicationController
  before_action :load_course_subjets, only: [:show]
  
  def show
    @tasks = Task.list_tasks_by_subject_id @course_subject.subject_id
    @user_tasks = UserTask.list_users_tasks params[:id]
    return if @tasks.any?

    flash.now[:danger] = t :flash_danger_c_user_tasks
    redirect_to root_path
  end

  private

  def load_course_subjets
    @user_course_subject = UserCourseSubject.find_by id: params[:id]
    @course_subject = CourseSubject.find_by id: @user_course_subject.course_subject_id
    return if @course_subject.present? && @user_course_subject.course_user.user_id == current_user.id

    flash.now[:danger] = t :flash_danger_c_user_tasks
    redirect_to root_path
  end
end
