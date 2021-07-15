class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  belongs_to :subject

  validates :subject_id, presence: true
  validates :name_task, presence: true

  scope :list_tasks_by_subject_id, ->(subject_id) {where "subject_id = ?", subject_id}
end
