# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Me::Events', type: :request do
  describe 'GET /api/me/events' do
    let(:user) { create(:user) }
    let(:rails_mokumoku) { create(:event) }
    let(:ruby_mokumoku) { create(:event) }
    let(:php_mokumoku) { create(:event) }
    before do
      login_user(user, 'password', login_path)
      user.attend(rails_mokumoku)
      user.attend(ruby_mokumoku)
    end

    it '自分が参加するもくもく会情報を返す' do
      get '/api/me/events'
      expect(response.status).to eq 200
      events = JSON.parse(response.body)['events']
      expect(events).to match_array([rails_mokumoku, ruby_mokumoku].map do |event|
        include(
          'id' => event.id,
          'title' => be_present,
          'start' => be_present,
          'url' => be_present
        )
      end)
    end
  end
end
