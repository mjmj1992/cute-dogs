module AccountsHelper  
  def authenticate_user!
    return if admin_signed_in?
    super
  end

  def current_member
    return current_user if user_signed_in?
    return current_admin if admin_signed_in?
  end

  def member_signed_in?
    user_signed_in? || admin_signed_in?
  end
end
