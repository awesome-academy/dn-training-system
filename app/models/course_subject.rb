class CourseSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :course
  has_many :user_course_subjects, dependent: :destroy

  enum status: {in_process: 0, pending: 1, done: 2, closed: 3}

  delegate :name_subject, to: :subject
end
