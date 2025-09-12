# == Schema Information
#
# Table name: archives
#
#  id         :bigint           not null, primary key
#  type       :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_archives_on_message_id  (message_id)
#  index_archives_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (user_id => users.id)
#
class Archive < ApplicationRecord
    

    belongs_to :message
    belongs_to :user
end
