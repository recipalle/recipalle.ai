# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        if resource.persisted?
          # Call the mailer to send the welcome email after successful registration
          UserMailer.welcome_email(resource).deliver_later
        end
      end
    end
  
    protected
  
    def after_sign_up_path_for(resource)
      recipes_path
    end
  end   