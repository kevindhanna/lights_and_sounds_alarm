class Task < ApplicationRecord
  has_one :light_group, primary_key: :light_group_id, foreign_key: :hue_id

  DAYS_HASH = {
    1 => 'Monday',
    2 => 'Tuesday',
    4 => 'Wednesday',
    8 => 'Thursday',
    16 => 'Friday',
    32 => 'Saturday',
    64 => 'Sunday'
  }.freeze
  
  def self.pretty_days(bin_days)
    days = []
    DAYS_HASH.each do |key, day|
      days << day if bin_days & key == key
    end

    days.join(', ')
  end

  def pretty_action
    action.sub('_', ' ').capitalize
  end

  def pretty_duration
    self.duration < 60 ? unit = 'Second' : unit = 'Minute'
    unit == 'Minute' ? time = self.duration / 60 : time = self.duration
    string = "#{time} #{unit}"
    string += 's' if time > 1

    return string
  end

end
