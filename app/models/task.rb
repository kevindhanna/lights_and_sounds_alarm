class Task < ActiveRecord::Base
  has_one :light_group, primary_key: :light_group_id, foreign_key: :hue_id

  def self.pretty_days(binary)
    return "Monday" if binary == '1' 
    return "Tuesday" if binary == '10' 
    return "Wednesday" if binary == '100' 
    return "Thursday" if binary == '1000' 
    return "Friday" if binary == '10000' 
    return "Saturday" if binary == '100000' 
    "Sunday"
  end
end