class UserTask < ApplicationRecord
  belongs_to :task
  belongs_to :user_course_subject, autosave: true

  enum status: {in_process: 0, done: 1, pending: 2, closed: 3}
end
