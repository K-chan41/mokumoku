# frozen_string_literal: true

class Notifications::AllReadsController < ApplicationController
  def create
    current_user.notifications.update_all(read: true) # rubocop:disable Rails/SkipsModelValidations
    redirect_back(fallback_location: root_path, success: '全て既読にしました')
  end
end
