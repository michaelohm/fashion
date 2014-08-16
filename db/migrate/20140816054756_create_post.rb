class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.string :description
    	t.integer :likecount, :default => 0
    end
  end
end
