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
    belongs_to :answer, class_name: 'Message', optional: true, foreign_key: 'answer_id'
    has_many :replies, class_name: 'Message', foreign_key: 'answer_id'
    
    has_one_attached :message_file
    belongs_to :user
    belongs_to :chat
end
