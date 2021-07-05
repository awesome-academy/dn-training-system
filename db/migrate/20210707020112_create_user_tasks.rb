class CreateUserTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tasks do |t|
      t.bigint :task_id
      t.bigint :user_course_subject_id
      t.integer :status, default: 0

      t.timestamps
    end
    add_foreign_key :user_tasks, :tasks
    add_foreign_key :user_tasks, :user_course_subjects
  end
end
