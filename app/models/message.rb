class Message < ApplicationRecord
    has_one :archive
    has_one :message
    
    belongs_to :user
    belongs_to :chat
end
