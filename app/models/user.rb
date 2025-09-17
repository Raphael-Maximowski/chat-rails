# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string(255)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :initiated_chats, class_name: 'Chat', foreign_key: 'initializer_id'
    has_many :received_chats, class_name: 'Chat', foreign_key: 'receptor_id'
    
    has_many :messages
    has_many :archives
end
