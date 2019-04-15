class UserController < ApplicationController

    def show
        @user=User.find(params[:id])
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            @error="New user information invalid. Please re-enter."
            render: new_user_path
        end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest, :first_name, :last_name)
    end
end