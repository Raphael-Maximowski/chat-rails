class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text_message, :created_at, :updated_at, :message_file_url, :is_reply

  belongs_to :answer, serializer: MessageSerializer, optional: true

  belongs_to :user
  belongs_to :chat

  def message_file_url
    if object.message_file.attached?
      Rails.application.routes.url_helpers.rails_blob_url(object.message_file)
    end
  end

  def is_reply
    object.answer_id.present?
  end
end
