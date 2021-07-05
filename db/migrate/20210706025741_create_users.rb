class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :birthday
      t.boolean :gender, default: false
      t.string :address
      t.integer :role

      t.timestamps
    end
  end
end
