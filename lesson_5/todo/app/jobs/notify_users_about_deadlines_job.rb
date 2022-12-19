# frozen_string_literal: true

require 'rake'

class NotifyUsersAboutDeadlinesJob < ApplicationJob
  queue_as :default

  def perform
    Rake::Task.clear
    Todo::Application.load_tasks
    Rake::Task['mail_tasks:notify_about_deadlines'].invoke
  end
end
