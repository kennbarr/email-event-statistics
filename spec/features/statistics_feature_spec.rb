require 'rails_helper'

feature 'Can view email statistics' do
  context 'email events have been received' do
    scenario 'should display a page of statistics' do
      visit '/'
      expect(page).to have_content 'Statistics'
    end
  end
end
