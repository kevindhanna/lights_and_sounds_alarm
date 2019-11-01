class AddForeignKeyToTasks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tasks, :light_groups, column: :group_id, primary_key: :hue_id
  end
end
