feature 'light group schedule' do
  context 'no schedules set' do
    scenario 'view schedules' do
      open_first_group
      expect(page).to have_content "No Schedules set"
      expect(page).to have_content "Schedule Task"
    end
  end
end