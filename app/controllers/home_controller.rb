# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    flash[:notice] = "ทดสอบข้อความ Flash ค่ะ 🎉"
  end
end
