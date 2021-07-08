class Course < ApplicationRecord
  validates :name, :description, :start_date, :due_date, presence: true
end
