feature 'light group schedule' do
  context 'no schedules set' do
    scenario 'view schedules' do
      LightGroup.update_groups
      open_first_group
      expect(page).to have_content "No Schedules set"
      expect(page).to have_content "Schedule Task"
    end
  end
end