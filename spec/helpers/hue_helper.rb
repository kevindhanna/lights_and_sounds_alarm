# frozen_string_literal: true

def group_names
  client = Hue::Client.new
  client.groups.map(&:name)
end

def groups
  client = Hue::Client.new
  client.groups
end
