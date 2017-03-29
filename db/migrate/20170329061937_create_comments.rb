class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.string :name
    	t.text :body
    	t.references :user, index: true
        t.references :event,index:true

      t.timestamps
    end
  end
end
