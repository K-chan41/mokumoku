# frozen_string_literal: true

class Mypage::TopsController < Mypage::BaseController
  def show
    @events = current_user.attend_events.limit(4)
  end
end
