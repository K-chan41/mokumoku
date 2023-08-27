# frozen_string_literal: true

class Mypage::NotificationsController < Mypage::BaseController
  def index
    @notifications = current_user.notifications.with_avatar.order(created_at: :desc).page(params[:page])
  end
end
