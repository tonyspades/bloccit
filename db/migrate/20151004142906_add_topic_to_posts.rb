class AddTopicToPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :topic_id
    add_column :posts, :topic_id, :integer
    add_index :posts, :topic_id
  end
end
