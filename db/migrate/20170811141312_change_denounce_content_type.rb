class ChangeDenounceContentType < ActiveRecord::Migration[5.1]
  def change
  	change_column :denounces, :content, :text
  end
end
