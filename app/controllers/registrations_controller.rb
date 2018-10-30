class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    #  destroy_user_session_path, method: :delete
    # "https://www.google.com.au"
    new_supplier_registration_path
  end

  def new_supplier
    build_resource({})
    respond_with self.resource
  end
end