class DefaultsNickAndName < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :nick, :string, default: ""
    change_column :users, :name, :string, default: ""
  end
end
