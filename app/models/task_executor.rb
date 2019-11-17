class TaskExecutor < ApplicationRecord
  ACTION_KEY = {
    'turn_off' => { on: false },
    'turn_on' => { on: true }
  }.freeze

  def self.light_group_class
    LightGroup
  end

  def self.execute(task)
    light_group = light_group_class.find_by(hue_id: task.light_group_id)
    action = ACTION_KEY[task.action]
    result = light_group.state(action, duration: task.duration)
    return :success if result.first['success']

    :fail
  end
end
