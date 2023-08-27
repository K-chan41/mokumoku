# frozen_string_literal: true

class Mypage::Profiles::AvatarsController < Mypage::BaseController
  def destroy
    current_user.avatar.purge
    redirect_back(fallback_location: root_path, success: '削除しました')
  end
end
