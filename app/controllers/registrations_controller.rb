class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    #  destroy_user_session_path, method: :delete
    "https://www.google.com.au"
  end
end