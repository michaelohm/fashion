class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.references :user
    	t.references :post
    	t.boolean :liked, default: false
    	t.timestamps
    end
  end
end
