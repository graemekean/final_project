class CreateStems < ActiveRecord::Migration
  def change
    create_table :stems do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :description
      t.string :key
      t.decimal :bpm
      t.string :instrument
      t.datetime :date_created

      t.timestamps null: false
    end
  end
end
