class AddIsPrivateToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :is_private, :boolean
  end
end
