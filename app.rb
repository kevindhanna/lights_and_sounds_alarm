require './config/environment.rb'

class LightsAndSoundsAlarm < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  get '/' do
    @groups = LightGroup.all
    @page = :home
    erb :template
  end
  
  get '/groups/:id' do
    @group = LightGroup.find_by(hue_id: params[:id])
    @page = :'groups/group'
    erb :template
  end

  get '/tasks/:id' do
    task = Task.find(params[:id])
    result = TaskExecutor.execute(task)
    redirect_link = "/groups/#{task.light_group_id}/tasks/#{task.id}"
    session[:test_result] = result
    redirect redirect_link
  end
  
  get '/groups/:id/tasks/set' do
    @group = LightGroup.find_by(hue_id: params[:id])
    @page = :'groups/tasks/set'
    erb :template
  end

  get '/groups/:id/tasks/:task_id' do
    @result = session[:test_result]
    @group = LightGroup.find_by(hue_id: params[:id])
    @task = Task.find(params[:task_id])
    @days = Task.pretty_days(@task.days)
    @page = :'groups/tasks/view'
    erb :template
  end

  post '/groups/:id/tasks' do
    days = 0
    params.each do |key, value|
      days += value.to_i if key.to_s.include?('day')
    end
    Task.create(
      name: params[:task_name],
      time: params[:time],
      days: days,
      action: params[:action],
      light_group_id: params[:id]
    )
    redirect "/groups/#{params[:id]}"
  end
end