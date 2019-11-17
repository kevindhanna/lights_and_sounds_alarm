puts 'setting up task scheduler...'
ScheduleTaskJob.set(wait_until: Date.tomorrow.midnight).perform_later