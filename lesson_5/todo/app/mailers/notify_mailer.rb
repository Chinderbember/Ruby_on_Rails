# frozen_string_literal: true

class NotifyMailer < ApplicationMailer
  SECONDS_IN_DAY = 24 * 3600

  def user_deadlines(user)
    @ending_events = ending_events(user)
    mail(
      to: user.email,
      subject: I18n.t('emails.subjects.user_deadlines')
    )
  end

  def ending_events(user)
    user.events.select { |event| event.finished_at - Time.now < SECONDS_IN_DAY }
  end
end
