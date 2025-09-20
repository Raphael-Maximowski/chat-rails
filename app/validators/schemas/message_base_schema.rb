class MessageBaseSchema < Dry::Validation::Contract
    MAX_TEXT_SIZE = 65535
    MIN_TEXT_SIZE = 1

    option :user_repository
    option :chat_repository
    option :message_repository

    params do
        required(:user_id).filled(:integer, gt?: 0)
        required(:chat_id).filled(:integer, gt?: 0)
        optional(:archive_id).filled(:integer, gt?: 0)
        optional(:text_message).filled(:string, max_size?: MAX_TEXT_SIZE, min_size?: MIN_TEXT_SIZE)
    end

    rule(:user_id) do
        key.failure('invalid user') unless user_repository.user_exists?(value)
    end

    rule(:chat_id) do
        key.failure('invalid chat') unless chat_repository.chat_exists?(value)
    end

    rule(:chat_id, :user_id) do
        key.failure('cannot interact in this chat') unless chat_repository.chat_interaction_avaliable?(
            values[:chat_id], 
            values[:user_id]
        )
    end

    rule(:text_message, :archive_id) do
        key.failure('insert a message or archive') if !values[:text_message] && !values[:archive_id]
    end
end