class ChangeProfileInfleuncesToInfluences < ActiveRecord::Migration
  def change
    rename_column :profiles, :infleunces, :influences

  end
end
