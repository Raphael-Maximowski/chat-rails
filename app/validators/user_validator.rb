require_dependency Rails.root.join('app', 'validators', 'schemas', 'user_schema')

class UserValidator < ApplicationValidator
    class << self
        attr_writer :user_repository
        def user_repository
            @user_repository ||= UserRepository.new
        end
    end

    def self.validate (params, excluded_id: nil)
        schema = Validators::Schemas::UserSchema.new(
            user_repository: user_repository,
            excluded_id: excluded_id
        )

        schema.call(params)
    end
end