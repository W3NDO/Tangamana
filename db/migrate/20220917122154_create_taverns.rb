class CreateTaverns < ActiveRecord::Migration[7.0]
  def change
    create_table :taverns do |t|
      t.string :name, null: false
      t.string :topic, null: true
      t.integer :user_id

      t.timestamps
    end
  end
end
