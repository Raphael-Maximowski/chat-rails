# == Schema Information
#
# Table name: messages
#
#  id           :bigint           not null, primary key
#  text_message :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  answer_id    :bigint
#  chat_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  fk_message_answer_id  (answer_id)
#  fk_message_chat_id    (chat_id)
#  fk_message_user_id    (user_id)
#
# Foreign Keys
#
#  fk_message_answer_id  (answer_id => messages.id)
#  fk_message_chat_id    (chat_id => chats.id)
#  fk_message_user_id    (user_id => users.id)
#
class Message < ApplicationRecord
    has_one :message
    
    belongs_to :user
    belongs_to :chat
end
