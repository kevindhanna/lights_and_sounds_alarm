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
    days = 0
    params.each do |key, value|
      days += value.to_i if key.to_s.include?('day')
    end
    Task.create(
      name: params[:task_name],
      time: params[:time],
      days: days,
      action: params[:group_action],
      light_group_id: params[:group_id]
    )
    redirect_to "/groups/#{params[:group_id]}"
  end

  def test
    task = Task.find(params[:id])
    result = TaskExecutor.execute(task)
    redirect_link = "/groups/#{task.light_group_id}/tasks/#{task.id}"
    flash[:test_result] = result
    redirect_to redirect_link
  end
end
