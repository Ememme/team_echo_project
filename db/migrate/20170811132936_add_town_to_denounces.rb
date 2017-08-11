class AddTownToDenounces < ActiveRecord::Migration[5.1]
  def change
    add_reference :denounces, :town, foreign_key: true
  end
end
