# == Schema Information
#
# Table name: chats
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  initializer_id :bigint           not null
#  receptor_id    :bigint           not null
#
# Indexes
#
#  fk_chat_initializer_id  (initializer_id)
#  fk_chat_receptor_id     (receptor_id)
#
# Foreign Keys
#
#  fk_chat_initializer_id  (initializer_id => users.id)
#  fk_chat_receptor_id     (receptor_id => users.id)
#
require "test_helper"

class ChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
