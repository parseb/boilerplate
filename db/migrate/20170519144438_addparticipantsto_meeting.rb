class AddparticipantstoMeeting < ActiveRecord::Migration[5.0]
  def change
  		change_table :meetings do |m|
  			m.string :participants 
  			m.string :data 
  		end
  end
end
