class ChangeNameOfGroupIdColumnInGroupMembershipsTable < ActiveRecord::Migration
  def change
    rename_column :group_memberships, :group_is, :group_id
    
  end
end
