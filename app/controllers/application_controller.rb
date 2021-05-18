class ApplicationController < ActionController::Base
  before_action:authenticate_admin!,except: [:top, :about]

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      admin_path(resource)
    end

    def after_log_in_path_for(resource)
      admin_path(resource)
    end


  before_action:authenticate_member!,except: [:top, :about]

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      public_member_path(resource)
    end

    def after_log_in_path_for(resource)
      public_member_path(resource)
    end



  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end

end
