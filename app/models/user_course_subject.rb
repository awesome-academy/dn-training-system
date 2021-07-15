class UserCourseSubject < ApplicationRecord
  belongs_to :course_user
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy

  enum status: {in_process: 0, pending: 1, done: 2, closed: 3}

  delegate :name_subject, to: :course_subject

  scope :list_user_course_subject, ->(course_user_id) {where "course_user_id = ?", course_user_id}
end
