class TaskScheduler < ApplicationRecord

  def self.schedule_tasks
    Task.all.each do |task|
      scehdule_task(task)
    end
  end
  
  def self.scehdule_task(task)
    day = Time.now.strftime("%A")
    return unless Task.pretty_days(task.days).include?(day)

    time = task.time.split(':').map! { |num| num.to_i }
    time = Date.today.midnight + time[0].hours + time[1].minutes
    
    ExecuteTaskJob.set(wait_until: time).perform_later(task.id)
  end
end
