class AddUserForeignKeyInArchives < ActiveRecord::Migration[8.0]
  def change
    add_reference :archives, :user, foreign_key: true
  end
end
