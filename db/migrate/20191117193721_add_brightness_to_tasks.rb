class AddBrightnessToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :brightness, :integer
  end
end
