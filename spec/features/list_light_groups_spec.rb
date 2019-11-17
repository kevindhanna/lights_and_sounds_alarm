# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'list light groups' do
  scenario 'user visits home page' do
    LightGroup.update_groups
    groups = group_names

    visit '/'
    groups.each do |group|
      expect(page).to have_content(group)
    end
  end
end
