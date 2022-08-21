# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @done_events_amount = Event.group_done_by_user_id.count
    @users = User.includes(:events).all
  end
end
