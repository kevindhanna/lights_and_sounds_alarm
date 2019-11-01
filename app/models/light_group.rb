class LightGroup < ActiveRecord::Base
  has_many :tasks, primary_key: :hue_id
  
  def self.update_groups
    self.hue_client.groups.each do |group|
      unless self.find_by(hue_id: group.id)
        self.create(name: group.name, hue_id: group.id)
      end
    end
  end

  def lights
    LightGroup.hue_client.group(self.hue_id).lights
  end

  private 

  def self.hue_client
    @hue_client ||= Hue::Client.new
  end
end