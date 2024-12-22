class Users::PasswordsController < Devise::PasswordsController
  def create
    self.resource = resource_class.find_by(email: params[resource_name][:email])
    if resource
      resource.send_new_password
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      respond_with resource, location: after_sending_reset_password_instructions_path_for(resource)
    else
      set_flash_message(:alert, :not_found) if is_navigational_format?
      respond_with resource
    end
  end
end
