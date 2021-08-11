class RepliesController < ApplicationController

    def index
        @replies = Reply.all
        render "api/replies/index"
    end

    def show
        @reply = Reply.find(params[:id])
        render "api/replies/show"
    end

    def create
        @reply = Reply.new(reply_params)
        @reply.user_id = current_user.id

        if @reply.save
            render "api/users/show"
        else
            render json @reply.errors.errors_full_messgaes, status 422
        end
    end

    def destroy
        @reply = current_user.replies.find_by(id: paramas[:id])
        @reply.delete if @reply.user_id == current_user.id
    end



    private

    def reply_params
        params.require(:reply).permit(:user_id, :body, :purr_id)
    end


end
