class CreateUsers < ActiveRecord::Migration
  create_table :users do |t|
    t.string :first_name
    t.string :last_name
    t.string :email
    t.string :password
    t.string :password_confirmation
    t.string :encrypted_password
  end
end
