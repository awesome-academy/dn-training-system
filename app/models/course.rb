class Course < ApplicationRecord
  has_many :course_users, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  accepts_nested_attributes_for :course_subjects
  scope :last_course, ->{order :status}

  enum status: {in_process: 0, done: 1, pending: 2, closed: 3}
end
