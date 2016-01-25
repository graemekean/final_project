class AddVideoAndSoundToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :video, :string
    add_column :statuses, :sound, :string



  end
end
