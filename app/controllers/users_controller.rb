class UsersController < ApplicationController

    def show
        @user=User.find(params[:id])
        @most_recent_review = Review.select{|r| r.user_id == @user.id}.sort.last
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
flash[:failure]="New user information invalid. Please re-enter."
            render new_user_path
        end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if  @user.update(user_params)
flash[:success]="Your profile has been successfully updated."
            redirect_to user_path(@user)
        else
flash[:failure]="There was a problem while updating your profile. Please try again."
            redirect_to edit_user_path(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :password_confirmation)
    end
end
