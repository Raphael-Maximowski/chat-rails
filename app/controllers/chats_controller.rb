class ChatsController < ApplicationController
    before_action :set_chat, only: [:show]

    def index
        chats = Chat.all
        render json: chats
    end 

    def show
        render json: @chat
    end

    def create
        validation = ChatValidator.validate(chat_params)

        if validation.success?
            @chat = Chat.create(validation.to_h)
            render json: @chat, status: :created
        else
            render json: {
                errors: validation.errors.to_h
            }, status: :unprocessable_entity
        end
    end

    private

    def set_chat
        @chat = Chat.find(params[:id])
    end 

    def chat_params
        params.permit(:initializer_id, :receptor_id).to_h
    end
end
