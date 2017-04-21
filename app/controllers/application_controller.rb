class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protected
  # Layout per resource_name
def layout_by_resource
  if devise_controller? && resource_name == :admin
    "backoffice_devise"
  else
    "application"
  end
end

def user_not_authorized
    flash[:alert] = t('messages.error_auth')
    redirect_to(request.referrer || root_path)
  end

# Layout per resource_name AND action
#def layout_by_resource
#  if devise_controller? && resource_name == :user && action_name == "new"
#    "layout_name_for_devise"
#  else
#    "application"
#  end
#end

end
