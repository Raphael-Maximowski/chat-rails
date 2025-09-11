class User < ApplicationRecord
    has_many :initiated_chats, class_name: 'Chat', foreign_key: 'initializer_id'
    has_many :received_chats, class_name: 'Chat', foreign_key: 'receptor_id'
    
    has_many :messages
    has_many :archives
end
