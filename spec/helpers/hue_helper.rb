def get_group_names
  client = Hue::Client.new
  client.groups.map do |group|
    group.name
  end
end

def get_groups
  client = Hue::Client.new
  client.groups
end
