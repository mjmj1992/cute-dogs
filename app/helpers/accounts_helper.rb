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

  def destroy_member_session_path
    return destroy_user_session_path if user_signed_in?
    return destroy_admin_session_path if admin_signed_in?
  end

  def current_member_email
    current_member.try(:email)
  end

  def member_signed_in?
    current_member.present?
  end 
end
