class AddUserEmailToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :user_email, :string
  end
end
