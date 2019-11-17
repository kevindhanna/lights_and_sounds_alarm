class AddLightGroupToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :light_group, null: false, primary_key: :hue_id
  end
end
