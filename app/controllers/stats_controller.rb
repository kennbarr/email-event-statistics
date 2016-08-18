class StatsController < ApplicationController

  def initialize
    @stats = StatsCalc.new
  end

  def index
    @total_stats = @stats.total_stats
    @rate_stats = @stats.rate_stats
  end
end
