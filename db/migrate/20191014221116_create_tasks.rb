# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :group_id, :index
      t.string :name
      t.string :action
      t.string :time
      t.integer :days
      t.timestamps
    end
  end
end
