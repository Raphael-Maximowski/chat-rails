class MessageCreateSchema < MessageBaseSchema            
    params do
        optional(:answer_id).filled(:integer, gt?: 0)
    end

    rule(:answer_id) do
        next unless value
        
        key.failure('invalid answer id') unless message_repository.message_exists?(value)
    end

    rule(:answer_id, :chat_id) do
        next unless values[:answer_id]

        key.failure('message doesnt belongs to this chat') unless message_repository.message_belongs_to_chat?(
            values[:answer_id],
            values[:chat_id]
        )
    end
end