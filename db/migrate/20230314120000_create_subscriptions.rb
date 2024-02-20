# db/migrate/20230315000000_create_subscriptions.rb
class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end