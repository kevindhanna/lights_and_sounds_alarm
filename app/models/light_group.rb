# frozen_string_literal: true

class LightGroup < ActiveRecord::Base
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

  def state(params)
    hue_group.set_state(params)
  end

  private

  def hue_group
    LightGroup.hue_client.group(hue_id)
  end
end
