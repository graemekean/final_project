class AddFeaturedTrackToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :featured_track, :string
    add_column :profiles, :featured_playlist, :string

  end
end
