class MessageCreateSchema < MessageBaseSchema  
    MAX_FILE_SIZE = 10.megabytes.freeze
    MAX_FILE_SIZE_IN_MB = (MAX_FILE_SIZE / 1.megabyte).to_i.freeze
    ALLOWED_TYPES = [
        'application/pdf',
        'image/jpeg', 'image/png'
    ].freeze
    ALLOWED_TYPES_STRING = ALLOWED_TYPES.join(', ')
    
    params do
        optional(:answer_id).filled(:integer, gt?: 0)
    end

    rule(:text_message, :file_message) do
    if !values[:text_message] && !values[:file_message]
        [:text_message, :file_message].each do |field|
        key(field).failure('inset a text or archive')
        end
    end
    end

    rule(:file_message) do
        next unless value

        unless valid_file?(value)
            key.failure('insert a valid file')
            next
        end
        
        unless valid_file_type?(value)
            error_message = "Invalid File Format! Acceptable: #{ALLOWED_TYPES_STRING}"
            key.failure(error_message)
            next
        end

        unless valid_file_size?(value)
            error_message = "Invalid File Size! Acceptable: #{MAX_FILE_SIZE_IN_MB} MB"
            key.failure(error_message)
        end
    end

    rule(:answer_id) do
        next unless value
        
        key.failure('invalid answer id') unless message_repository.message_exists?(value)
    end

    rule(:answer_id, :chat_id) do
        next unless values[:answer_id]

        key.failure('message doesnt belongs to this chat') unless message_repository.message_belongs_to_chat?(
            values[:answer_id],
            values[:chat_id]
        )
    end

    private

def valid_file?(file)
    file.is_a?(ActionDispatch::Http::UploadedFile) || 
    file.is_a?(Rack::Test::UploadedFile)
  end

  def valid_file_type?(file)
    ALLOWED_TYPES.include?(file.content_type)
  end

  def valid_file_size?(file)
    file.size <= MAX_FILE_SIZE
  end
end