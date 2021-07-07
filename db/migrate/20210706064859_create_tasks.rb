class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name_task
      t.bigint :subject_id

      t.timestamps
    end
    add_foreign_key :tasks, :subjects
  end
end
