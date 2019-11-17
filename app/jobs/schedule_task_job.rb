class ScheduleTaskJob < ApplicationJob
  queue_as :default
  repeat 'every day at 12am'

  def perform(*args)
    TaskScheduler.schedule_tasks
  end
end
