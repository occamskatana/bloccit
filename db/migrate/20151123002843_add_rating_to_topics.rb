class AddRatingToTopics < ActiveRecord::Migration
  def change
  	add_column :ratings, :topic_id, :integer
  end
end
