# frozen_string_literal: true

class Comment < ApplicationRecord
  include Notifiable
  belongs_to :user
  belongs_to :event
end
