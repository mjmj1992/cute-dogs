module MemberPage
    extend ActiveSupport::Concern
  
    included do
      before_action :member_redirect, except: [:destroy]
    end
  
    def member_redirect
      redirect_to root_path if user_signed_in? || admin_signed_in?
    end
  
  end
  