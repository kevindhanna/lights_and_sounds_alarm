class TaskExecutor

  def self.setup
    @hue_client = self.hue_client
  end

  def self.execute(task)
    group = self.hue_client.group(task.light_group_id)
    action = ACTION_KEY[task.action]
    group.set_state(action)
  end
  
  private

  ACTION_KEY = {
    'turn_off' => {on: false}
  }

  def self.hue_client
    Hue::Client.new
  end
end