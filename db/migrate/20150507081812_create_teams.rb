class CreateTeams < ActiveRecord::Migration[4.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :number
      t.timestamps null: false
    end
  end
end
