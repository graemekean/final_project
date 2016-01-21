class AddLinkedInUrlToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :linkedin_url, :string

  end
end
