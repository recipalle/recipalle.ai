class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :subscription

  def subscribed?
    # A user is considered subscribed if they have an associated subscription record.
    self.subscription.present?
  end
end
