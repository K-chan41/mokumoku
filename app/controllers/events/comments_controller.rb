# frozen_string_literal: true

class Events::CommentsController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  def create
    @event = Event.find(params[:event_id])
    comment = current_user.comments.build(comment_params.merge(event_id: @event.id))
    if comment.save
      ([*@event.commented_users, *@event.attendees, @event.user] - [current_user]).uniq.each do |user|
        NotificationFacade.commented_to_event(comment, user)
      end
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
