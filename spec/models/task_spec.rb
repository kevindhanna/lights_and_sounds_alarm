require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'knows its light_group' do
    test_group = LightGroup.create(hue_id: 1, name: 'test_group')
    task = Task.create(light_group_id: test_group.hue_id, action: 'turn_off')
    expect(task.light_group).to eq test_group
  end

  describe '.pretty_days' do
    it 'returns Monday when passed 1' do
      expect(Task.pretty_days(1)).to eq 'Monday'
    end
    it 'returns "Tuesday" when passed 10' do
      expect(Task.pretty_days(2)).to eq 'Tuesday'
    end
    it 'returns "Wednesday" when passed 100' do
      expect(Task.pretty_days(4)).to eq 'Wednesday'
    end
    it 'returns "Thursday" when passed 1000' do
      expect(Task.pretty_days(8)).to eq 'Thursday'
    end
    it 'returns "Friday" when passed 10000' do
      expect(Task.pretty_days(16)).to eq 'Friday'
    end
    it 'returns "Saturday" when passed 100000' do
      expect(Task.pretty_days(32)).to eq 'Saturday'
    end
    it 'returns "Sunday" when passed 1000000' do
      expect(Task.pretty_days(64)).to eq 'Sunday'
    end
    it 'returns "Monday, Wednesday Friday" when passed 10101' do
      expect(Task.pretty_days(21)).to eq 'Monday, Wednesday, Friday'
    end
  end

  describe 'pretty_action' do
    it 'returns Turn Off for turn_off' do
      test_group = LightGroup.create(hue_id: 1, name: 'test_group')
      task = Task.create(light_group_id: test_group.hue_id, action: 'turn_off')
      expect(task.pretty_action).to eq 'Turn off'
    end
    it 'returns Turn On' do
      test_group = LightGroup.create(hue_id: 1, name: 'test_group')
      task = Task.create(light_group_id: test_group.hue_id, action: 'turn_on')
      expect(task.pretty_action).to eq 'Turn on'
    end
  end
  
  describe 'pretty_duration' do
    it 'returns a nice string for duration' do
      test_group = LightGroup.create(hue_id: 1, name: 'test_group')
      task = Task.create(light_group_id: test_group.hue_id, action: 'turn_on', duration: 30)
      expect(task.pretty_duration).to eq '30 Seconds'
    end
    it 'returns a nice string for duration' do
      test_group = LightGroup.create(hue_id: 1, name: 'test_group')
      task = Task.create(light_group_id: test_group.hue_id, action: 'turn_on', duration: 60)
      expect(task.pretty_duration).to eq '1 Minute'
    end
    it 'returns a nice string for duration' do
      test_group = LightGroup.create(hue_id: 1, name: 'test_group')
      task = Task.create(light_group_id: test_group.hue_id, action: 'turn_on', duration: 300)
      expect(task.pretty_duration).to eq '5 Minutes'
    end
  end
end
