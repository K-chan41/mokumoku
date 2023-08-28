# frozen_string_literal: true

class EventAttendance < ApplicationRecord
  include Notifiable
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id }

  def self.create_and_notify(user, event)
    event_attendance = EventAttendance.create(user: user, event: event)
    (event.attendees - [user] + [event.user]).uniq.each do |attendee|
      NotificationFacade.attended_to_event(event_attendance, attendee)
    end
    event_attendance
  end
end
