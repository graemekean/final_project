class CreateMixers < ActiveRecord::Migration
  def change
    create_table :mixers do |t|
      t.integer :project_id
      t.string :status

      t.timestamps null: false
    end
  end
end
