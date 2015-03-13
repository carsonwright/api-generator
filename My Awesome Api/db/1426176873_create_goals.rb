class CreateGoals < ActiveRecord::Migration
  create_table :goals do |t|
    t.string :definition
    t.string :honest
    t.string :plate
    t.integer :space_id
  end
end
