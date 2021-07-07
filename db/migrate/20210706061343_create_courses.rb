class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name_coures
      t.string :description
      t.date :start_date
      t.date :due_date

      t.timestamps
    end
  end
end
