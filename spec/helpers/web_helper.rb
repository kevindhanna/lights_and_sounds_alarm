def open_first_group
  group = get_groups.first
  lights = group.lights
  visit '/'
  click_link group.name
  [lights, group]
end