# app/controllers/subscriptions_controller.rb
class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    token = params[:stripeToken]

    # Create a Stripe customer
    customer = Stripe::Customer.create({
      email: current_user.email,
      source: token,
    })

    # Create a Stripe subscription
    subscription = Stripe::Subscription.create({
      customer: customer.id,
      items: [{ plan: 'price_1MmLspDdIOvx0m026K2KUYkp' }],
    })

    # Save the subscription in your database
    current_user.build_subscription(active: true).save!

    # Send the subscription confirmation email
    UserMailer.subscription_confirmation(current_user).deliver_now

    flash[:notice] = "Your subscription has been created successfully!"
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    render :new
  end

  def payment
  end
end