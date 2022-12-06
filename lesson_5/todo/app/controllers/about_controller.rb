# frozen_string_literal: true

##
# Controller for providing support info
class AboutController < ApplicationController
  ##
  # GET /about
  #
  # Action returns "About" page
  def index
    session[:about_counter] ||= 0
    session[:about_counter] += 1
  end

  ##
  # GET /about/help
  #
  # Action returns "Help" page
  def help; end
end
