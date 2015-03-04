class AddUserFirstNameToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :user_first_name, :string
  end
end
