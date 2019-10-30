feature 'list light groups' do
  scenario 'user visits home page' do
    groups = get_group_names
    
    visit '/'
    groups.each do |group|
      expect(page).to have_content(group)
    end
  end
end