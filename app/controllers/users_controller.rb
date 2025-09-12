class UsersController < ApplicationController
    before_action :set_user, only: [:update, :destroy, :show]

    def index
        users = User.all
        render json: users
    end

    def show
        render json: @user
    end

    def destroy
        @user.delete
        head :no_content
    end

    def create
        validation = UserValidator.validate(user_params)

        if validation.success?
            @user = User.create(validation.to_h)
            render json: @user, status: :created 
        else
            render json: { errors: validation.errors.to_h }, status: :unprocessable_entity
        end
    end

    def update
        validation = UserValidator.validate(user_params, excluded_id: @user.id)

        if validation.success?
            @user.update(validation.to_h)
            render json: @user, status: :ok
        else
            render json: { errors: validation.errors.to_h }, status: :unprocessable_entity
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:email, :name).to_h
    end
end
