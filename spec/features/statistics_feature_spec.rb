require 'rails_helper'

feature 'Can view email statistics' do
  fixtures :events

  before(:each) do
    visit '/'
  end

  scenario 'should display total number of emails sent' do
    expect(page).to have_content 'Sent: 3'
  end

  scenario 'should display total number of emails opened' do
    expect(page).to have_content 'Opened: 2'
  end

  scenario 'should display total number of clicks' do
    expect(page).to have_content 'Clicks: 1'
  end

  scenario 'should display open rate of Order emails' do
    within('#Order-stats') { expect(page).to have_content 'Open rate: 50%' }
  end

  scenario 'should display click rate of Order emails' do
    within('#Order-stats') { expect(page).to have_content 'Click rate: 50%' }
  end

end
