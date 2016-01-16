class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :title
      t.decimal :bpm
      t.string :key
      t.string :creator
      t.string :genre
      t.boolean :public
      t.boolean :editable
      t.string :description
      t.datetime :created_at
      t.boolean :published
      t.datetime :published_at
      t.string :preview_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
