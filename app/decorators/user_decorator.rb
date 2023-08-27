# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def avatar
    object.avatar.presence || 'user-default-image.png'
  end
end
