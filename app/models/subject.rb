class Subject < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  scope :last_subject, ->{order :start_date_learn}
end
