require 'rails_helper'

RSpec.describe LightGroup, type: :model do
  let(:hue_group2) { double(:hue_group, name: 'test2', id: 2) }
  let(:hue_group) { double(:hue_group, name: 'test', id: 1) }
  let(:hue_client) { double(:hue_client, groups: [hue_group, hue_group2], group: hue_group) }
  subject(:light_group) { LightGroup.create(name: 'test', hue_id: 1) }

  it 'knows its name' do
    expect(light_group.name).to eq 'test'
  end
  it 'knows its hue id' do
    expect(light_group.hue_id).to eq 1
  end
  it 'knows its tasks' do
    task = Task.create(light_group_id: light_group.hue_id)
    expect(light_group.tasks.first).to eq task
  end

  describe '.update_groups' do
    it 'updates the groups from the Hue hub' do
      allow(LightGroup).to receive(:hue_client) { hue_client }
      expect(hue_client).to receive(:groups)
      LightGroup.update_groups
      expect(LightGroup.find_by(hue_id: 2).name).to eq 'test2'
    end
  end

  describe 'state' do
    it 'passes the state to the Hue group' do
      allow(LightGroup).to receive(:hue_client) { hue_client }
      expect(hue_client).to receive(:group).with(light_group.hue_id)
      expect(hue_group).to receive(:set_state).with(on: true, brightness: 0 )
      expect(hue_group).to receive(:set_state).with({ brightness: 100 }, 60)

      light_group.state({ on: true }, duration: 60)
    end
  end
  describe 'lights' do
    it 'gets a list of lights from the hue client' do
      allow(LightGroup).to receive(:hue_client) { hue_client }
      expect(hue_client).to receive(:group).with(light_group.hue_id)
      expect(hue_group).to receive(:lights)
      light_group.lights
    end
  end
end
