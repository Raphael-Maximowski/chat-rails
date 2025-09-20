module Validators
    module Schemas
        class UserSchema < Dry::Validation::Contract
            option :user_repository
            option :excluded_id, optional: true

            params do
                required(:email).filled(:string, max_size?: 255)
                required(:name).filled(:string, max_size?: 50)
            end

            rule(:email) do
                unless URI::MailTo::EMAIL_REGEXP.match?(value)
                    key.failure('must be a valid email format')
                end
            end

            rule(:email) do
                if excluded_id
                    if user_repository.email_exists_excluding_id?(value, excluded_id)
                        key.failure('has already been taken')
                    end
                else
                    if user_repository.email_exists?(value)
                        key.failure('has already been taken')    
                    end 
                end
            end
        end
    end
end