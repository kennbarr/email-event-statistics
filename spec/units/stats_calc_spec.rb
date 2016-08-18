require_relative '../../app/services/stats_calc'
require 'rails_helper'

describe StatsCalc do

  subject(:stats_calc) { described_class.new }

  describe "#total_stats" do
    it "returns total statistics for all email events" do
      expect(stats_calc.total_stats[:sent]).to eq 3
      expect(stats_calc.total_stats[:opened]).to eq 2
      expect(stats_calc.total_stats[:clicked]).to eq 1
    end
  end

  describe "#rate_stats" do
    it "returns event rates for individual email types" do
      expect(stats_calc.rate_stats["Order"][:opened]).to eq 0.5
      expect(stats_calc.rate_stats["Order"][:clicked]).to eq 0.5
      expect(stats_calc.rate_stats["Shipment"][:opened]).to eq 0.0
      expect(stats_calc.rate_stats["Shipment"][:clicked]).to eq 0.0
    end
  end

end
