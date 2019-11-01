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

  post '/groups/:id/tasks' do
    days = 0
    params.each do |key, value|
      days += value.to_i if key.to_s.include?('day')
    end
    Task.create(
      name: params[:task_name],
      time: params[:time],
      light_group_id: params[:id]
    )
    redirect "/groups/#{params[:id]}"
  end
end