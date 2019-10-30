feature 'view group lights' do
  scenario 'open first group' do
    lights, group = open_first_group
    lights.each do |light|
      expect(page).to have_content(light.name)
    end
  end
end