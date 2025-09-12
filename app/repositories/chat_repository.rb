class ChatRepository
    def chat_already_initialized?(initializer_id, receptor_id)
        Chat.where(initializer_id: initializer_id, receptor_id: receptor_id)
            .or(Chat.where(initializer_id: receptor_id, receptor_id: initializer_id))
            .exists?
    end
end