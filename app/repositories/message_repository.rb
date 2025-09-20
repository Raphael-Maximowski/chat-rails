class MessageRepository
    def message_exists?(message_id)
        Message.where(id: message_id).exists?
    end

    def message_belongs_to_chat?(message_id, chat_id)
        Message.where(id: message_id, chat_id: chat_id).exists?
    end

    def message_belongs_to_user?(user_id, message_id)
        Message.where(id: message_id, user_id: user_id).exists?
    end
end