class StatsCalc

  def total_stats
    {
      sent: Event.where(event: "send").count,
      clicked: Event.where(event: "click").count,
      opened: Event.where(event: "open").count
    }
  end

  def rate_stats
    Event.distinct.pluck(:email_type).each_with_object({}) do |type, rates|
      rates[type] = { opened: get_rate(type, "open"),
                      clicked: get_rate(type, "click") }
    end
  end

  private

  def get_rate(type, event)
    type_count = Event.where(email_type: type, event: "send").count
    event_count = Event.where(email_type: type, event: event).count
    type_count == 0 ? 0 : event_count/type_count.to_f
  end
end
