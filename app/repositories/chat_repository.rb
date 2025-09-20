class ChatRepository
    def chat_already_initialized?(initializer_id, receptor_id)
        Chat.where(initializer_id: initializer_id, receptor_id: receptor_id)
            .or(Chat.where(initializer_id: receptor_id, receptor_id: initializer_id))
            .exists?
    end

    def chat_exists?(chat_id)
        Chat.where(id: chat_id).exists?
    end

    def chat_interaction_avaliable?(chat_id, user_id)
       Chat.where(id: chat_id)
          .where("initializer_id = ? OR receptor_id = ?", user_id, user_id)
          .exists?
    end
end