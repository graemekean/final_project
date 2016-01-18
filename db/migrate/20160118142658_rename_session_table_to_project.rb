class RenameSessionTableToProject < ActiveRecord::Migration
  def change
    rename_table :sessions, :projects
  end
end
