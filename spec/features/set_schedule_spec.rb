# frozen_string_literal: true

feature 'set group schedule' do
  before :each do
    LightGroup.update_groups
  end
  scenario 'visit schedule page' do
    days = %w[
      Monday
      Tuesday
      Wednesday
      Thursday
      Friday
      Saturday
      Sunday
    ]
    open_first_group
    click_link 'Schedule Task'
    days.each do |day|
      expect(page).to have_unchecked_field(day)
    end
    expect(page).to have_unchecked_field('Turn On')
    expect(page).to have_unchecked_field('Turn Off')
    expect(page).to have_field('Time')
    expect(page).to have_field('Name Your Task')
  end

  scenario 'set schedule for first group' do
    open_first_group
    create_a_task
    expect(page).not_to have_content 'No Schedules set'
    expect(page).to have_link 'test task'
  end
end
