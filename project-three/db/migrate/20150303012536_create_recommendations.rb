class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :social_media
      t.boolean :is_public
      t.string :handle
      t.integer :user_id_to
      t.integer :user_id
      t.boolean :is_funny
      t.boolean :is_food
      t.boolean :is_news
      t.boolean :is_fashion
      t.boolean :is_sports
      t.boolean :is_tv
      t.boolean :is_film
      t.boolean :is_music
      t.boolean :is_blog

      t.timestamps null: false
    end
  end
end
