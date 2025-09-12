class ChatsController < ApplicationController
    def index
        chats = Chat.all()
        render json: chats
    end

    def show
        chat = Chat.find(params[:id])
        render json: chat
    end

    def destroy
        chat = Chat.find(params[:id])
        chat.delete()
    end

    def chat_params
        params.permit(:initializer_id, :receptor_id)
    end

    def create
        chat = Chat.new(chat_params)

        if chat.save()
            render json: chat
        else
            render json: {
                errors: chat.errors.full_messages
            }, status: :unprocessable_entity
        end
    end
end
