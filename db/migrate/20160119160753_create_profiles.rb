class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_name
      t.string :youtube_url
      t.string :profile_image
      t.string :profile_video
      t.string :about_me

      t.timestamps null: false
    end
  end
end
