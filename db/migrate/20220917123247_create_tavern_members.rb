class CreateTavernMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :tavern_members do |t|
      t.integer :tavern_id
      t.integer :user_id

      t.timestamps
    end
  end
end
