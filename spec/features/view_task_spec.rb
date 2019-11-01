feature 'view a task' do
  before :each do
    LightGroup.update_groups
  end
  scenario 'user creates and opens a task' do
    open_first_group
    create_a_task
    click_link 'test task'
    expect(page).to have_content('test task')
    expect(page).to have_content('11:11')
    expect(page).to have_content(day = Date.today.strftime("%A"))
    expect(page).to have_content('Turn on')
  end
end