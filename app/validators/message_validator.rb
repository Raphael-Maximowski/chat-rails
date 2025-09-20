class MessageValidator < ApplicationValidator
    class << self
        attr_writer :user_repository
        def user_repository
            @user_repository ||= UserRepository.new
        end

        attr_writer :chat_repository
        def chat_repository
            @chat_repository ||= ChatRepository.new
        end

        attr_writer :message_repository
        def message_repository
            @message_repository ||= MessageRepository.new
        end
    end

    def self.create_validate(params)
        schema = MessageCreateSchema.new(
            user_repository: user_repository,
            chat_repository: chat_repository,
            message_repository: message_repository
        )

        schema.call(params)
    end

    def self.update_validate(params, message_id)
        schema = MessageUpdateSchema.new(
            user_repository: user_repository,
            chat_repository: chat_repository,
            message_repository: message_repository,
            message_id: message_id
        )

        schema.call(params)
    end
end