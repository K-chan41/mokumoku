# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    receiver { nil }
    sender { nil }
    notifiable { nil }
    message { 'MyText' }
    read { false }
    kind { 1 }
  end
end
