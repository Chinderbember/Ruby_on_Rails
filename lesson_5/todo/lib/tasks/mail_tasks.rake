# frozen_string_literal: true

namespace :mail_tasks do
  desc 'Notify all users about deadlines of their events'
  task notify_about_deadlines: :environment do
    notify_mailer_obj = NotifyMailer.new
    User.all.each do |user|
      NotifyMailer.user_deadlines(user).deliver_now unless notify_mailer_obj.ending_events(user).empty?
    end
  end
end
