require 'rails_helper'

RSpec.describe TaskExecutor, type: :model do
  let(:light_group) { double(:hue_group, state: [{ 'success' => { '/groups/6/action/on' => true } }]) }
  let(:light_group_class) { double(:light_group_class, find_by: light_group) }

  describe 'execute' do
    context 'given a task id' do
      it 'executes the task' do
        test_group = LightGroup.create(name: 'test_group', hue_id: 1)
        task = Task.create(light_group_id: test_group.hue_id, action: 'turn_off')

        allow(TaskExecutor).to receive(:light_group_class) { light_group_class }
        expect(light_group_class).to receive(:find_by).with(hue_id: task.light_group_id)
        expect(light_group).to receive(:state).with(on: false)

        TaskExecutor.execute(task)
      end
      it 'returns :pass' do
        allow(TaskExecutor).to receive(:light_group_class) { light_group_class }
        test_group = LightGroup.create(name: 'test_group', hue_id: 1)
        task = Task.create(light_group_id: test_group.hue_id, action: 'turn_off')
        result = TaskExecutor.execute(task)
        expect(result).to eq :success
      end
      it 'returns :pass' do
        allow(TaskExecutor).to receive(:light_group_class) { light_group_class }
        allow(light_group).to receive(:state) { [{ 'fail' => nil }] }
        test_group = LightGroup.create(name: 'test_group', hue_id: 1)
        task = Task.create(light_group_id: test_group.hue_id, action: 'turn_off')
        result = TaskExecutor.execute(task)
        expect(result).to eq :fail
      end
    end
  end
end
