class AddUsersToDenounces < ActiveRecord::Migration[5.1]
  def change
    add_reference :denounces, :author_user, foreign_key: {to_table: :users}
    add_reference :denounces, :denounced_user, foreign_key: {to_table: :users}
  end
end
