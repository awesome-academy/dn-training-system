class CreateUserCourseSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_course_subjects do |t|
      t.integer :status, default: 0
      t.bigint :course_subject_id
      t.bigint :course_user_id

      t.timestamps
    end
    add_foreign_key :user_course_subjects, :course_subjects
    add_foreign_key :user_course_subjects, :course_users
  end
end
