# class ApplicationController < ActionController::Base
#     before_action :authenticate_user!, except: [:new]
#     before_action :configure_permitted_parameters, if: :devise_controller?

#   protected
#    def configure_permitted_parameters
#      added_attrs = [ :email, :name, :password, :password_confirmation ]
#      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
#      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
#      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
#    end

#    def after_sign_in_path_for(resource)
#      user_path(current_user.id)
#    end
# end




class ApplicationController < ActionController::Base
      before_action :authenticate_user!, except: [:new]

 # 下記を追加
 before_action :configure_permitted_parameters, if: :devise_controller?

 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end

    def after_sign_in_path_for(resource)
     user_path(current_user.id)
   end
end