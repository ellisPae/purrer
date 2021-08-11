class PurrsController < ApplicationController

    def index
        @purrs = Purr.all
        render "api/purr/index"
    end

    def show
        @purr = Purr.find(params[:id])
        render "/api/purrs/show"
    end
    
    def create
        @purr = Purr.new(purr_params)
        @purr.user_id = current_user.id

        if @track.save
            render "api/purrs/show"
        else
            render json @purr.errors_full_messgaes, status: 402
    end

    def destroy
        @purr = current_user.purrs.find_by(id: params[:id])
        @purr.delete if @purr && @purr.user_id == current_user.id
        render "api/users/show"
    end




    private


    def purr_params
        params.require(:purr).permit(:user_id, :content, :original_purr_id)
    end


end
