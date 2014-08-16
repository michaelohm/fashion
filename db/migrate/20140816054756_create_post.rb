class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.references :user
    	t.string :title
    	t.string :description
    	t.attachment :photo
    	t.integer :likecount, :default => 0
    	t.integer :commentcount, :default => 0
    end
  end
end
