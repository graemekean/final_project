class AddMembershipIdToStems < ActiveRecord::Migration
  def change
    add_column :stems, :membership_id, :integer

  end
end
