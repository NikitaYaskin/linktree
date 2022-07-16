class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  def index
    @should_render_navbar = true
  end

  def appearance
    @should_render_navbar = true 
  end

  def show
    redirect_to dashboard_path if @user.nil? 

    @links = @user.links.where.not(url: '', title: '')
  end

  private

  def set_user
    begin
      @user = User.friendly.find(params[:id])
    rescue StandardError
      @user = nil
    end
  end
end
