# frozen_string_literal: true

class EventsStats
  class << self
    def events_for_each_user
      ordered_ids = User.order(:name).ids

      pre_output = ordered_ids.map do |id|
        [id, Event.where(user_id: id).ids]
      end
      pre_output.to_h
    end

    def items_for_user_count(arr_with_events_id)
      items_in_each_event = Item.group(:event_id).count

      (arr_with_events_id.map { |event_id| items_in_each_event[event_id] }).sum
    end

    def result
      pre_output = events_for_each_user.transform_values do |v|
        [v.size, items_for_user_count(v)]
      end

      pre_output = pre_output.transform_keys { |k| User.find(k).name }

      output = []
      pre_output.each { |k, v| output << "#{k} - events: #{v.first}, items: #{v.last}" }
      output
    end
  end
end
