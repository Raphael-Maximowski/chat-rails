module Validators
    module Schemas
        class ChatSchema < Dry::Validation::Contract
            option :user_repository
            option :chat_repository

            params do
                required(:initializer_id).filled(:integer)
                required(:receptor_id).filled(:integer)
            end

            rule(:initializer_id) do
                if !user_repository.user_exists?(value)
                    key.failure('invalid user')
                end
            end

            rule(:receptor_id) do
                if !user_repository.user_exists?(value)
                    key.failure('invalid user')
                end
            end

            rule(:receptor_id, :initializer_id) do
                if (values[:receptor_id] == values[:initializer_id])
                    key(:receptor_id).failure('cannot be the same as initializer')
                    key(:initializer_id).failure('cannot be the same as receptor')
                end
            end

            rule(:receptor_id, :initializer_id) do
                if chat_repository.chat_already_initialized?(values[:initializer_id], values[:receptor_id])
                    key(:receptor_id).failure('chat already initialized')
                    key(:initializer_id).failure('chat already initialized')
                end
            end
        end
    end
end