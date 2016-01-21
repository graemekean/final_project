class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.integer :project_id
      t.string :title
      t.string :file_name
      t.integer :user_id
      t.string :instrument
      t.decimal :bpm
      t.string :key
      t.string :notes

      t.timestamps null: false
    end
  end
end
