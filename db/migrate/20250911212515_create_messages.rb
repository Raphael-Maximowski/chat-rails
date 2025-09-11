class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.text :text_message
      t.bigint :archive_id
      t.bigint :answer_id

      t.bigint :chat_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end

    add_foreign_key :messages, :archives, column: :archive_id, primary_key: :id, name: 'fk_message_archive_id'
    add_foreign_key :messages, :messages, column: :answer_id, primary_key: :id, name: 'fk_message_answer_id'
    add_foreign_key :messages, :chats, column: :chat_id, primary_key: :id, name: 'fk_message_chat_id'
    add_foreign_key :messages, :users, column: :user_id, primary_key: :id, name: 'fk_message_user_id'
  end
end
