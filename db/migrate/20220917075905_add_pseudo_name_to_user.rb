class AddPseudoNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pseudo_name, :string
    add_column :users, :color, :string
  end
end
