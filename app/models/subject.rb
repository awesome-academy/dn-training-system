class Subject < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  validates :name_subject, :description, :total_date_lean, :start_date_learn, presence: true
  scope :last_subject, -> {order :start_date_learn}
end
