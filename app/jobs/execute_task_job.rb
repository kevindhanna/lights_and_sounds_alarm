class ExecuteTaskJob < ApplicationJob
  queue_as :default

  def perform(*task_id)
    TaskExecutor.execute(Task.find(task_id).first)
  end
end
