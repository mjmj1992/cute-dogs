class HomeController < ApplicationController
  include AccountsHelper
  before_action :authenticate_user!
  
  def index
    @member_signed_in = member_signed_in?
    @current_member_email = current_member.try(:email)
  end
end
