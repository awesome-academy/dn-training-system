class UserCourseSubject < ApplicationRecord
  belongs_to :course_user
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy

  enum status: {in_process: 0, pending: 1, done: 2, closed: 3}

  delegate :name_subject, to: :course_subject
  delegate :subject_id, to: :course_subject
end
