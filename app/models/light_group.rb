class LightGroup < ApplicationRecord
  has_many :tasks, primary_key: :hue_id

  def self.hue_client
    @hue_client ||= Hue::Client.new
  end

  def self.update_groups
    hue_client.groups.each do |group|
      unless find_by(hue_id: group.id)
        create(name: group.name, hue_id: group.id)
      end
    end
  end

  def lights
    hue_group.lights
  end

  def state(params, duration: 0, brightness: 100)
    return hue_group.set_state(params) unless duration > 0

    if params[:on]
      hue_group.set_state(on: true, brightness: 0)
      hue_group.set_state({ brightness: brightness }, duration)
    end
  end

  private

  def hue_group
    LightGroup.hue_client.group(hue_id)
  end
end

puts 'setting up light groups...'
LightGroup.update_groups
