class UpdateUserGender < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :gender, :integer
    change_column_default :users, :gender, 0
  end
end
