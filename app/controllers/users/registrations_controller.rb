class Users::RegistrationsController < Devise::RegistrationsController
  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end
