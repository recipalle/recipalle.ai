# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
    # The secret key used by Devise. Devise uses this key to generate
    # random tokens. Changing this key will render invalid all existing
    # confirmation, reset password and unlock tokens in the database.
    config.secret_key = Rails.application.credentials.secret_key_base
  
    # ==> ORM configuration
    # Load and configure the ORM. Supports :active_record (default) and
    # :mongoid (bson_ext recommended) by default. Other ORMs may be
    # available as additional gems.
    require 'devise/orm/active_record'
  
    # ==> Mailer Configuration
    # Configure the e-mail address which will be shown in Devise::Mailer,
    # note that it will be overwritten if you use your own mailer class
    # with default "from" parameter.
    config.mailer_sender = 'recipalleai@gmail.com'
  
    # Configure the class responsible to send e-mails.
    # config.mailer = 'Devise::Mailer'
  
    # ==> Controller configuration
    # Configure the parent class to the devise controllers.
    # config.parent_controller = 'DeviseController'
  
    # ==> Warden Configuration
    # If you want to use other strategies, that are not supported by Devise,
    # or change the failure app, you can configure them inside the config.warden block.
    #
    # config.warden do |manager|
    #   manager.intercept_401 = false
    #   manager.default_strategies(scope: :user).unshift :some_external_strategy
    # end
  
    # ==> Mountable engine configurations
    # When using Devise inside an engine, let's call it `MyEngine`, and this engine
    # is mountable, there are some extra configurations to be taken into account.
    # The following options are available, assuming the engine is mounted as:
    #
    #     mount MyEngine, at: '/my_engine'
    #
    # The router that invoked `devise_for`, in the example above, would be:
    # config.router_name = :my_engine
    #
    # When using OmniAuth, Devise cannot automatically set OmniAuth path,
    # so you need to do it manually. For the users scope, it would be:
    # config.omniauth_path_prefix = '/my_engine/users/auth'
  
    # ==> Turbolinks configuration
    # If your app is using Turbolinks, Turbolinks::Controller needs to be included to make redirection work correctly:
    #
    # ActiveSupport.on_load(:devise_failure_app) do
    #   include Turbolinks::Controller
    # end
  end  