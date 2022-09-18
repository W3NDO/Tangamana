class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :content
      t.integer :tavern_id
      t.integer :user_id

      t.timestamps
    end
  end
end
