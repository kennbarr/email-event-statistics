require 'rails_helper'

feature 'Can view email statistics' do
  fixtures :events

  scenario 'should display total number of emails sent' do
    visit '/'
    expect(page).to have_content 'Sent: 3'
  end

  scenario 'should display total number of emails opened' do
    visit '/'
    expect(page).to have_content 'Opened: 2'
  end

  scenario 'should display total number of clicks' do
    visit '/'
    expect(page).to have_content 'Clicks: 1'
  end

end
