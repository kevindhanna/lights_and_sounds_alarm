describe Task do
  before :each do
    test_group = LightGroup.create(hue_id: 1, name: 'test_group')
    task = Task.create(light_group_id: test_group.hue_id, action: 'turn_off')
  end
  it 'knows its light_group' do
    expect(task.light_group).to eq test_group
  end

  describe 'pretty_days' do
    it 'returns Monday when passed 1' do
      expect(Task.pretty_days(1)).to eq 'Monday'
    end
    it 'returns "Monday, Wednesday" when passed 5' do
      expect(Task.pretty_days(5)).to eq 'Monday, Wednesday'
    end
  end
end