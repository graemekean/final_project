class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
