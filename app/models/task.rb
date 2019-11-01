class Task < ActiveRecord::Base
  has_one :light_group, primary_key: :light_group_id, foreign_key: :hue_id

  def self.pretty_days(binary)
    return "Monday" if binary == 1 
    'Monday, Wednesday'
  end
end