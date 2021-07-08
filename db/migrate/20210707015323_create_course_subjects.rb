class CreateCourseSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :course_subjects do |t|
      t.integer :status, default: 0
      t.bigint :course_id
      t.bigint :subject_id

      t.timestamps
    end
    add_foreign_key :course_subjects, :courses
    add_foreign_key :course_subjects, :subjects
  end
end
