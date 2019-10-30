class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :group_id, :index
      t.string :name
      t.string :action
      t.integer :time
      t.integer :days
      t.timestamps
    end
  end
end
