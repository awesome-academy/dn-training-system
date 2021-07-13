class CourseUser < ApplicationRecord
  has_many :user_course_subjects, dependent: :destroy
  belongs_to :user
  belongs_to :course

  enum status: {in_process: 0, pending: 1, done: 2, closed: 3}
end
