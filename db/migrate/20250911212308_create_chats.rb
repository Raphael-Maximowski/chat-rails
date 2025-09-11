class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.bigint :initializer_id, null: false
      t.bigint :receptor_id, null: false

      t.timestamps
    end

    add_foreign_key :chats, :users, column: :initializer_id, primary_key: :id, name: 'fk_chat_initializer_id'
    add_foreign_key :chats, :users, column: :receptor_id, primary_key: :id, name: 'fk_chat_receptor_id'
  end
end
