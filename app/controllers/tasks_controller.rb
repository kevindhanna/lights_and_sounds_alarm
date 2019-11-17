class TasksController < ApplicationController

  def show
    @group = LightGroup.find_by(hue_id: params[:group_id])
    @task = Task.find(params[:id])
    @days = Task.pretty_days(@task.days)
  end

  def new
    @task = Task.new
    @group = LightGroup.find_by(hue_id: params[:group_id])
  end

  def create
    duration = params['transition-duration'].to_i
    duration *= 60 if params['duration-units'] == 'minutes'

    task = Task.create(
      name: params[:task_name],
      time: params[:time],
      days: binary_days(params),
      action: params[:group_action],
      duration: duration,
      brightness: params[:brightness],
      light_group_id: params[:group_id]
    )
    
    TaskScheduler.scehdule_task(task) unless ENV['RAILS_ENV'] == 'test'
    redirect_to "/groups/#{params[:group_id]}"
  end

  def test
    task = Task.find(params[:id])
    result = TaskExecutor.execute(task)
    redirect_link = "/groups/#{task.light_group_id}/tasks/#{task.id}"
    flash[:test_result] = result
    redirect_to redirect_link
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to "/groups/#{params[:group_id]}"
  end

  private 

  def binary_days(params)
    days = 0
    params.each do |key, value|
      days += value.to_i if key.to_s.include?('day')
    end

    return days
  end
end
