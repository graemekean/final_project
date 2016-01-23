class AddInfluencesAndGenresAndRoleToProfileTable < ActiveRecord::Migration
  def change
    add_column :profiles, :infleunces, :string
    add_column :profiles, :genres, :string
    add_column :profiles, :role, :string
    add_column :profiles, :primary_discipline, :string

  end
end
