require 'rails_helper'

RSpec.feature 'test a task' do
  before :each do
    LightGroup.update_groups
  end
  scenario 'user clicks the delete task button' do
    open_kevins_nest
    create_a_task
    click_link 'test task'
    click_button 'Delete'
    expect(page).to_not have_content('test task')
    expect(page).to have_content("Kevin's Nest")
  end
end
