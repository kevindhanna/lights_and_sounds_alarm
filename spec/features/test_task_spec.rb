feature 'test a task' do
  before :each do
    LightGroup.update_groups
  end
  scenario 'user clicks the test task button' do
    open_kevins_nest
    create_a_task
    # expect(TaskExecutor).to receive(:execute).with(Task.all.first)
    click_link 'test task'
    click_link 'Test'
    expect(page).to have_content('Tested OK!')
  end
end