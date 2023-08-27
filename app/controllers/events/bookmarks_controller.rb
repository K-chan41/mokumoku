# frozen_string_literal: true

class Events::BookmarksController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    bookmark = current_user.bookmark(@event)
    NotificationFacade.liked_event(bookmark, @event.user)
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.unbookmark(@event)
  end
end
