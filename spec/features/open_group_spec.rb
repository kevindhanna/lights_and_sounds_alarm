# frozen_string_literal: true

feature 'view group lights' do
  scenario 'open first group' do
    LightGroup.update_groups
    lights, _group = open_first_group
    lights.each do |light|
      expect(page).to have_content(light.name)
    end
  end
end
