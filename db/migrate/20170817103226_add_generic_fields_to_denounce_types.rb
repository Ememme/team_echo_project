class AddGenericFieldsToDenounceTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :denounce_types, :gid, :integer
    add_column :denounce_types, :gid_desc, :string
    remove_column :denounce_types, :name, :string
  end
end
