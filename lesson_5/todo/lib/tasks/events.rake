# frozen_string_literal: true

namespace :events do
  desc 'outputs users list in alphabet order with events and items amount for each user'
  task stats: :environment do
    # events_for_each_user = (User.order(:name).ids.map do |id|
    #                           [id, Event.where(user_id: id).ids]
    #                         end).to_h

    # items_in_each_event = Item.group(:event_id).count

    # pre_output =
    # events_for_each_user.transform_values {|v| [v.size, (v.map { |event_id| items_in_each_event[event_id]}).sum] }

    # pre_output =
    # pre_output.transform_keys{ |k| User.find(k).name}

    # pre_output.each { |k, v| puts "#{k} - events: #{v.first}, items: #{v.last}"}
    puts EventsStats.result
  end
end
