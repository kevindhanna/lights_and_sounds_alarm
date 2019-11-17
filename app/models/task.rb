# frozen_string_literal: true

class Task < ActiveRecord::Base
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

end
