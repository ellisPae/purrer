class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.includes(:email, :handle, :phone_number).find(params[:id])
        render 'api/users/profile'
    end
    
    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            render :show
        else
            render json: @user.errors_full_messgaes, status: 422
    end

    # def destroy
    #     @user = current_user.
    # end




    private


    def user_params
        params.require(:user).permit(:name, :handle, :email, :phone_number, 
            :dob, :bio, :password)
    end


end
