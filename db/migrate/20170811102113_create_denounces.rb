class CreateDenounces < ActiveRecord::Migration[5.1]
  def change
    create_table :denounces do |t|
      t.string :content

      t.timestamps
    end
  end
end
