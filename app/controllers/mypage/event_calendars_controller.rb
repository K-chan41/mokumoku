# frozen_string_literal: true

class Mypage::EventCalendarsController < Mypage::BaseController
  def show
    @bookmark_events = current_user.bookmark_events
    @future_events = current_user.attend_events.future
    @past_events = current_user.attend_events.past
  end
end
