describe Task do
  it 'knows its light_group' do
    test_group = LightGroup.create(name: 'test_group', hue_id: 1)
    task = Task.create(group_id: test_group.hue_id, action: 'turn_off')
    expect(task.light_group).to eq test_group
  end
end