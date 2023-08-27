# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :require_login

  def index
    @notifications = current_user.notifications
                                 .reads_with_avatar
                                 .order(created_at: :desc)
                                 .page(params[:page])
  end

  def show
    notification = current_user.notifications.find(params[:id])
    notification.read!
    redirect_to notification.path
  end
end
