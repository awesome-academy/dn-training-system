class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.date :date_report
      t.string :do_today
      t.string :problem
      t.string :do_tomorrow
      t.bigint :course_user_id

      t.timestamps
    end
    add_foreign_key :reports, :course_users
  end
end
