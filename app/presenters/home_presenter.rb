class HomePresenter < BasePresenter
  
    def initialize(photos, current_member)
        @photos, @current_member = photos, current_member
    end

    def current_member_email
        @current_member_email = @current_member.try(:email)
    end

    def member_signed_in?
        @current_member.present?
    end 

    def photos
        @photos
    end
  
  end
  