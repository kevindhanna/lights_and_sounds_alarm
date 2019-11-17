class GroupsController < ApplicationController

  def index
    @groups = LightGroup.all
  end

  def show
    @group = LightGroup.find_by(hue_id: params[:id])
  end
  
end
