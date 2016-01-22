class RemoveUserAndProjectFromStems < ActiveRecord::Migration
  def change
    remove_column :stems, :user_id, :integer
    remove_column :stems, :project_id, :integer
  end
end
