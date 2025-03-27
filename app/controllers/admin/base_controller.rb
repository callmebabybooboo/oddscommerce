# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_role

  private

  def check_admin_role
    unless current_user&.admin?
      redirect_to root_path, alert: "คุณไม่มีสิทธิ์เข้าถึงหน้านี้"
    end
  end
end
