class ScheduleTaskJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 24.hours

  def perform(*_args)
    TaskScheduler.schedule_tasks

    self.class.set(wait: RUN_EVERY).perform_later
  end
end

unless ENV['RAILS_ENV'] == 'test'
  puts 'setting up task scheduler...'
  ScheduleTaskJob.set(wait_until: Date.tomorrow.midnight).perform_later
end
