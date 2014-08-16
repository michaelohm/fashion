class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.references :post
    	t.attachment :photo
    	t.timestamps
    end
  end
end
