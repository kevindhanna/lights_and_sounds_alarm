describe LightGroup do
  subject(:light_group) { LightGroup.create(name: 'test', hue_id: 1) }
  it 'knows its name' do
    expect(light_group.name).to eq 'test'
  end
  it 'knows its hue id' do
    expect(light_group.hue_id).to eq 1
  end
end