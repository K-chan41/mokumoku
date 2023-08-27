# frozen_string_literal: true

class NotificationTiming < ApplicationRecord
  validates :timing, presence: true
  enum timing: {
    created_event: 0,
    commented_to_event: 1,
    attended_to_event: 2,
    liked_event: 3
  }
end
