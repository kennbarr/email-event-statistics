require 'rails_helper'

describe WebhooksController, type: :request do

  describe "#create" do

    test_event = { "Address": "bob@bob.com",
                   "EmailType": "Order",
                   "Event": "send",
                   "Timestamp": 1432820696 }

    it "adds event to database" do
      expect{ post '/', params: test_event.to_json }.to change{Event.count}.by 1
      expect(Event.last.address).to eq "bob@bob.com"
    end
  end

end
