class RemoveIsPublicFromRecommendations < ActiveRecord::Migration
  def change
    remove_column :recommendations, :is_public, :boolean
  end
end
