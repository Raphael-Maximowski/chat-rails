class AddMessageForeignKeyInArchive < ActiveRecord::Migration[8.0]
  def change
    add_reference :archives, :message, foreign_key: true
  end
end
