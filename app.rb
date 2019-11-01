require './config/environment.rb'

class LightsAndSoundsAlarm < Sinatra::Base
  register Sinatra::ActiveRecordExtension

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
  
  get '/groups/:id/tasks/set' do
    @group = LightGroup.find_by(hue_id: params[:id])
    @page = :'groups/tasks/set'
    erb :template
  end

  get '/groups/:id/tasks/:task_id' do
    @group = LightGroup.find_by(hue_id: params[:id])
    @task = Task.find(params[:task_id])
    @days = Task.pretty_days(@task.days)
    @page = :'groups/tasks/view'
    erb :template
  end

  post '/groups/:id/tasks' do
    time = params[:time].split(' ')[1][0..4]
    days = 0
    params.each do |key, value|
      days += value.to_i if key.to_s.include?('day')
    end
    Task.create(
      name: params[:task_name],
      time: time,
      days: days,
      action: params[:action],
      light_group_id: params[:id]
    )
    redirect "/groups/#{params[:id]}"
  end
end