class UserTask < ApplicationRecord
  belongs_to :task

  enum status: {in_process: 0, done: 1, pending: 2, closed: 3}

  scope :list_users_tasks, ->(user_course_subject_id) {where "user_course_subject_id = ?", user_course_subject_id}
end
