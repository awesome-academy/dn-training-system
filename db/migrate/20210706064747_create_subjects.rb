class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name_subject
      t.string :description
      t.integer :total_date_lean
      t.date :start_date_learn

      t.timestamps
    end
  end
end
