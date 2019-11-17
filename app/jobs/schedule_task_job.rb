class ScheduleTaskJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 24.hours

  def perform(*args)
    TaskScheduler.schedule_tasks

    self.class.set(wait: RUN_EVERY).perform_later
  end
end
