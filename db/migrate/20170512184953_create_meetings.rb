class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|

      t.timestamps null: false

      t.string :title
      t.text :description

      t.references :user 

      t.string :start_at 
      

    end
  end
end
