class AddDefautlForCourseStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :courses, :status, 0
  end
end
