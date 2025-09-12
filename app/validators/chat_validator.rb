require_dependency Rails.root.join('app', 'validators', 'schemas', 'chat_schema')

class ChatValidator < ApplicationValidator
    class << self
       attr_writer :user_repository
       def user_repository
            @user_repository ||= UserRepository.new
       end

       attr_writer :chat_repository
       def chat_repository
            @chat_repository ||= ChatRepository.new
       end
    end

    def self.validate(params)
        schema = Validators::Schemas::ChatSchema.new(
            user_repository: user_repository,
            chat_repository: chat_repository
        )

        schema.call(params)
    end
end