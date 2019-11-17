# frozen_string_literal: true

class CreateLightGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :light_groups do |t|
      t.integer :hue_id, index: { unique: true }
      t.string :name
      t.timestamps
    end
  end
end
