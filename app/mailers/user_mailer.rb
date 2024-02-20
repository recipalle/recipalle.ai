class UserMailer < ApplicationMailer
    default from: 'no-reply@your_domain.com'
  
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
  
    def subscription_email(user)
      @user = user
      mail(to: @user.email, subject: 'You have successfully subscribed')
    end
  
    def monthly_receipt_email(user)
      @user = user
      mail(to: @user.email, subject: 'Your Monthly Receipt')
    end
  end  