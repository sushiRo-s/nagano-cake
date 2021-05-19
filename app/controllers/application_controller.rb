class ApplicationController < ActionController::Base
  before_action:authenticate_admin!,except: [:top, :about]
  #before_action:authenticate_member!,except: [:top, :about]

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if resource.is_a?(Admin)
      manager_order_path(resource)
      else resource.is_a?(Member)
      root_path(resource)
      end
    end

    def after_sign_up_path_for(resource)
      if resource.is_a?(Member)
      root_path(resource)
      end
    end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end

end
