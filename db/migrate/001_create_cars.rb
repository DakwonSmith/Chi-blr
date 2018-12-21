class CreateUser < ActiveRecord::Migration[5.0]
  def up
    create_table :user do |t|
      t.string :username
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
    end
  end

  def down
    drop_table :user
  end
end
