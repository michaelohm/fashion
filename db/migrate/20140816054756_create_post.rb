class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.references :user
    	t.string :title
    	t.string :description
    	t.attachment :photo
    	t.integer :viewcount, :default => 0
    	t.timestamps
    end
  end
end
