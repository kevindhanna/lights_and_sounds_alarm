feature 'test a task' do
  before :each do
    LightGroup.update_groups
  end
  scenario 'user clicks the test task button' do
    open_first_group
    create_a_task
    click_link 'test task'
    click_button 'Test'
    
  end
end