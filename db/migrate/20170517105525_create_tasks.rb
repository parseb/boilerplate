class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :meeting, foreign_key: true
      t.text :data

      t.timestamps
    end
  end
end
