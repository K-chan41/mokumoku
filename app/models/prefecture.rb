# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :events, dependent: :restrict_with_exception
end
