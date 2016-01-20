class AddStudioIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :studio_id, :integer
  end
end
