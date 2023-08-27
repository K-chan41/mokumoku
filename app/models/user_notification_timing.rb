# frozen_string_literal: true

class UserNotificationTiming < ApplicationRecord
  belongs_to :user
  belongs_to :notification_timing

  validates :user_id, uniqueness: { scope: :notification_timing_id }
end
