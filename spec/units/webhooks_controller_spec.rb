require_relative '../../app/controllers/webhooks_controller'
require 'rails_helper'

describe WebhooksController, :type => :request do
  test_event = { "Address":"barney@lostmy.name",
                 "EmailType":"Shipment",
                 "Event":"send",
                 "Timestamp":1432820696 }

  it "records webhook data to the database" do
    expect{ subject.create(test_event) }.to change{ Event.all.count }.by(1)
    expect(Event.last.timestamp).to eq test_event["Timestamp"]
  end

end
