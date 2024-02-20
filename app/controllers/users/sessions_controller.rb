class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate(scope: resource_name)
    
    if resource && resource.active_for_authentication?
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      respond_with resource, location: after_sign_in_path_for(resource) do |format|
        format.json { render json: { success: true } }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path, alert: 'Invalid email or password.' }
        format.json { render json: { success: false }, status: :unprocessable_entity }
      end
    end
  end
end