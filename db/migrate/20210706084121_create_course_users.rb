class CreateCourseUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :course_users do |t|
      t.integer :status, default: 0
      t.bigint :course_id
      t.bigint :user_id
      
      t.timestamps
    end
    add_foreign_key :course_users, :courses
    add_foreign_key :course_users, :users
  end
end
