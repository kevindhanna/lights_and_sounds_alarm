# frozen_string_literal: true

def hue_client
  Hue::Client.new
end

def hue_group(id)
  hue_client.group(id)
end
