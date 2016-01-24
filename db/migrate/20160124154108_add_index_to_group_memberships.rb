class AddIndexToGroupMemberships < ActiveRecord::Migration
  def change
    add_index :group_memberships, [:user_id, :group_is]
  end
end
