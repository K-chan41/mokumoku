# frozen_string_literal: true

class Mypage::BaseController < ApplicationController
  layout 'mypage/layouts/application'
  before_action :require_login
end
