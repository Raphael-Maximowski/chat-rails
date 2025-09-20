class MessagesController < ApplicationController
    before_action :set_message, only: [:destroy, :show, :update] 
    
    def index
        messages = Message.all
        render json: messages
    end

    def show
        render json: @message
    end

    def destroy
        @message.delete
        head :no_content
    end

    def update
        validation = MessageValidator.update_validate(message_params_update, params[:id])

        if  validate_update_params
            @message.update(@validation.to_h)
            render json: @message, status: :ok
        else
            render_validation_errors
        end
    end

    def create
        if validate_create_params
            @message = Message.create(@validation.to_h)
            render json: @message, status: :created
        else
            render_validation_errors
        end
    end

    private

    def set_message
        @message = Message.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        render json: { error: "Message not found" }, status: :not_found
    end

    def message_params_create
        params.permit(:text_message, :answer_id, :chat_id, :user_id, :archive_id).to_h
    end

    def message_params_update
        params.permit(:text_message, :user_id, :archive_id, :chat_id).to_h
    end

    def validate_create_params
        @validation = MessageValidator.create_validate(message_params_create)
        @validation.success?
    end

    def validate_update_params
        @validation = MessageValidator.update_validate(message_params_update, params[:id])
        @validation.success?   
    end

    def render_validation_errors
        render json: { errors: @validation.errors.to_h }, status: :unprocessable_entity
    end
end
