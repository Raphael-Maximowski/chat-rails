class Chat < ApplicationRecord
    belongs_to :initializer, class_name: 'User', foreign_key: 'initializer_id'
    belongs_to :receptor, class_name: 'User', foreign_key: 'receptor_id'
end
