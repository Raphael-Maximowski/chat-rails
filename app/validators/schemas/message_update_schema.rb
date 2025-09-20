class MessageUpdateSchema < MessageBaseSchema
    option :message_id

    params do
    end

    rule do
        base.failure('invalid message') unless message_repository.message_exists?(message_id)
    end

    rule(:chat_id) do
        key.failure('cannot update message from another chat') unless message_repository.message_belongs_to_chat?(message_id, value)
    end

    rule(:user_id) do
        key.failure('user cannot update message') unless message_repository.message_belongs_to_user?(value, message_id)
    end
end