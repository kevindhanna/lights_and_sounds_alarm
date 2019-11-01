class Task < ActiveRecord::Base
  has_one :light_group, primary_key: :group_id, foreign_key: :hue_id
end