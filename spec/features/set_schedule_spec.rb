feature 'set group schedule' do
  scenario 'visit schedule page' do
    days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ]
    visit '/'
    click_link "Kevin's Nest"
    click_link 'Schedule Task'
    days.each do |day|
      expect(page).to have_unchecked_field(day)
    end
    expect(page).to have_unchecked_field("Turn On")
    expect(page).to have_unchecked_field("Turn Off")
    expect(page).to have_field("Time")
    expect(page).to have_field("Name Your Task")
  end

  scenario 'set schedule for Kevins Nest' do
    time = Time.new + 5
    day = Date.today.strftime("%A")
    visit '/'
    click_link "Kevin's Nest"
    click_link 'Schedule Task'
    check day
    fill_in 'Time', with: time
    fill_in 'Name', with: 'test'
    find_by_id("action_0").click
    click_button "Submit"
    expect(page).to have_content "Kevin's Nest"
    expect(page).to have_link "test"
  end
end