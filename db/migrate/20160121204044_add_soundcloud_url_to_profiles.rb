class AddSoundcloudUrlToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :soundcloud_url, :string

  end
end
