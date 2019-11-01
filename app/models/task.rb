class Task < ActiveRecord::Base
  has_one :light_group, primary_key: :light_group_id, foreign_key: :hue_id

  def self.pretty_days(binary)
    days = []
    DAYS_HASH.each do |key, day|
      days << day if binary.to_i(2) & key == key
    end
    
    return days.join(', ')
  end

  private 

  DAYS_HASH = {
    1 => "Monday",
    2 => "Tuesday",
    4 => "Wednesday",
    8 => "Thursday",
    16 => "Friday",
    32 => "Saturday",
    64 => "Sunday"
  }
end