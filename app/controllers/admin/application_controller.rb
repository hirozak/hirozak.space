class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admin_users

  def only_admin_users
    render_404 unless current_user&.admin?
  end
end
