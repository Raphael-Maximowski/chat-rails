# == Schema Information
#
# Table name: messages
#
#  id           :bigint           not null, primary key
#  text_message :text(65535)               Optional
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  answer_id    :bigint                    Optional
#  archive_id   :bigint                    Optional
#  chat_id      :bigint           not null Required In Create
#  user_id      :bigint           not null Required In Both
#
# Indexes
#
#  fk_message_answer_id   (answer_id)
#  fk_message_archive_id  (archive_id)
#  fk_message_chat_id     (chat_id)
#  fk_message_user_id     (user_id)
#
# Foreign Keys
#
#  fk_message_answer_id   (answer_id => messages.id)
#  fk_message_archive_id  (archive_id => archives.id)
#  fk_message_chat_id     (chat_id => chats.id)
#  fk_message_user_id     (user_id => users.id)
#
class Message < ApplicationRecord
    has_one :archive
    has_one :message
    
    belongs_to :user
    belongs_to :chat
end
