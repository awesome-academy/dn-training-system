class UserCourseSubjectsController < ApplicationController
  def show
    @user_course_subjects = UserCourseSubject.list_user_course_subject params[:id]
  end
end
