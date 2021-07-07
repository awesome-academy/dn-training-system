class CourseDeleteCollumnSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :course_subjects, :course_user_id
    change_column_default :users, :role, 0
  end
end
