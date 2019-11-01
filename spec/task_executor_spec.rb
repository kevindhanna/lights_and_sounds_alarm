describe TaskExecutor do
  let(:hue_group) { double(:hue_group, set_state: nil) }
  let(:hue_client) { double(:hue_client, group: hue_group) }

  before :each do 
    TaskExecutor.setup
  end

  describe '.setup' do
    it 'instantiates the hue client' do
      expect(TaskExecutor).to receive(:hue_client) { hue_client }
      TaskExecutor.setup
    end
  end
  describe 'execute' do
    context 'given a task id' do
      it 'executes the task' do
        test_group = LightGroup.create(name: 'test_group', hue_id: 1)
        task = Task.create(group_id: test_group.hue_id, action: 'turn_off')

        allow(TaskExecutor).to receive(:hue_client) { hue_client }
        expect(hue_client).to receive(:group).with(task.group_id)
        expect(hue_group).to receive(:set_state).with({on: false})
        
        TaskExecutor.execute(task)
      end
    end
  end
end