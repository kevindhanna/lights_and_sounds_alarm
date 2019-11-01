class TaskExecutor

  def self.execute(task)
    light_group = self.light_group_class.find_by(hue_id: task.light_group_id)
    action = ACTION_KEY[task.action]
    light_group.set_state(action)
  end
  
  private

  ACTION_KEY = {
    'turn_off' => {on: false}
  }

  def self.light_group_class
    LightGroup
  end
end