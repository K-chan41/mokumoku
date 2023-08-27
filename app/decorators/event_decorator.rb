# frozen_string_literal: true

class EventDecorator < Draper::Decorator
  delegate_all

  def thumbnail
    object.thumbnail.presence || 'event-default-image.png'
  end
end
