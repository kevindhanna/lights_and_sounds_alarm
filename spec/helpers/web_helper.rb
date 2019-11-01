def open_first_group
  group = get_groups.first
  lights = group.lights
  visit '/'
  click_link group.name
  [lights, group]
end

def open_kevins_nest
  visit '/'
  click_link "Kevin's Nest"
end

def create_a_task
  time = '11:11'
  day = Date.today.strftime("%A")
  click_link 'Schedule Task'
  check day
  fill_in 'Time', with: time
  fill_in 'Name', with: 'test task'
  choose('action_0')
  find_by_id("action_0").click
  click_button "Submit"
end