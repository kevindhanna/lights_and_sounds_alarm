describe Task do
  before :each do
    test_group = LightGroup.create(hue_id: 1, name: 'test_group')
    task = Task.create(light_group_id: test_group.hue_id, action: 'turn_off')
  end
  it 'knows its light_group' do
    expect(task.light_group).to eq test_group
  end

  describe 'pretty_days' do
    it 'returns a string of days for a given binary list' do
      expect(Task.pretty_days(1)).to eq 'Monday'
    end
  end
end