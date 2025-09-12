# == Schema Information
#
# Table name: chats
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  initializer_id :bigint           not null
#  receptor_id    :bigint           not null
#
# Indexes
#
#  fk_chat_initializer_id  (initializer_id)
#  fk_chat_receptor_id     (receptor_id)
#
# Foreign Keys
#
#  fk_chat_initializer_id  (initializer_id => users.id)
#  fk_chat_receptor_id     (receptor_id => users.id)
#
class Chat < ApplicationRecord
    belongs_to :initializer, class_name: 'User', foreign_key: 'initializer_id'
    belongs_to :receptor, class_name: 'User', foreign_key: 'receptor_id'

    validates :initializer, presence: true
    validates :receptor, presence: true
end
