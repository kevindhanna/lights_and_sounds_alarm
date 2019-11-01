class RenameTaskGroupId < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :group_id, :light_group_id
  end
end
