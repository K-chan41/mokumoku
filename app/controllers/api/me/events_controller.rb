# frozen_string_literal: true

class Api::Me::EventsController < ApplicationController
  before_action :require_login

  def index
    @events = current_user.attend_events
  end
end
