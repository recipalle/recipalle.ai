namespace :send_monthly_receipts do
    desc "Send monthly receipts to subscribed users"
    task send_receipts: :environment do
      User.subscribed.each do |user|
        UserMailer.monthly_receipt_email(user).deliver_now
      end
    end
  end  