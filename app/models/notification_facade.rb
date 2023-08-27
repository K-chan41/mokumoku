# frozen_string_literal: true

class NotificationFacade
  def self.created_event(event, receiver)
    Notification.created_event(event, receiver)
    return unless receiver.allow_created_event_notification?

    EventMailer.with(user: receiver, event: event).created_event.deliver_later
  end

  def self.commented_to_event(comment, receiver)
    Notification.commented_to_event(comment, receiver)
    return unless receiver.allow_commented_to_event_notification?

    EventMailer.with(user: receiver, comment: comment).commented_to_event.deliver_later
  end

  def self.attended_to_event(event_attendance, receiver)
    Notification.attended_to_event(event_attendance, receiver)
    return unless receiver.allow_attended_to_event_notification?

    EventMailer.with(user: receiver, event_attendance: event_attendance).attended_to_event.deliver_later
  end

  def self.liked_event(bookmark, receiver)
    Notification.liked_event(bookmark, receiver)
    return unless receiver.allow_liked_event_notification?

    EventMailer.with(user: receiver, bookmark: bookmark).liked_event.deliver_later
  end
end
