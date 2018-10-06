class ApplicationController < ActionController::Base
  before_action :page_num

  # Devise/Kaminari

  def page_num
    @page_num ||= params[:page] || 1
  end
end
