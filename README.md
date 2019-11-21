# Lights and Sounds Alarm

This app is a home-automation-automator, currently working for Hue lights. It allows recurring events to be triggered turning lights off and on at given times.

## Installation

- `git clone` this repo
- `bundle install`
- get Redis working locally for Sidekiq task storage
This uses the Ruby Hue gem, which doesn't support light group transition times at the moment, so we have to edit `hue-0.2.0/lib/hue/group.rb` with the following:
``` ruby
def set_state(attributes, transition = nil)
  return if new?
  body = translate_keys(attributes, STATE_KEYS_MAP)

  # Add transition
  body.merge!({:transitiontime => transition}) if transition

  uri = URI.parse("#{base_url}/action")
  http = Net::HTTP.new(uri.host)
  response = http.request_put(uri.path, JSON.dump(body))
  JSON(response.body)
end
```


## How to Use

- `rails s` to start the dev server
- on start the console will give you 5 seconds to press the Hue button to allow pairing
- navigate to http://localhost:3000
- click a light group
- click add task (currently only on, off and ramp on work)
- select your options
  
You're done!  

Alternatively there's a dockerized branch that you can run `docker-compose up --build` from - just replace the Rails token / security stuff with your own.

## To-Do

- Update interface to work on mobile
- Form validation
- add support for ramping down lights
- add support for Hue colours and colour transitions
- Add support for Google Home to stop / start music at certain times
