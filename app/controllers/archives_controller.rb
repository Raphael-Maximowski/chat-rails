class ArchivesController < ApplicationController
    def index 
        archives = Archive.all()
        render json: archives
    end

    def show
        archive = Archive.find(params[:id])
        render json: archive
    end

    def destroy
        archive = Archive.find(params[:id])
        archive.delete()
    end

    def archive_params
        params.permit(:type, :url, :message_id, :user_id)
    end

    def create
        archive = Archive.new(archive_params)

        if archive.save()
            render json: archive, status: :created
        else
            render json: {
                errors: archive.errors.full_messages
            }, status: :unprocessable_entity
        end
    end

    def update
        archive = Archive.find(params[:id])

        if archive.update(archive_params)
            render json: archive, status: :ok
        else
            render json: {
                errors: archive.errors.full_messages
            }, status: :unprocessable_entity
        end
    end
end
