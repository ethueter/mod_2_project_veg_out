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
          @user.errors.full_messages.each do |error|
            flash[:failure]= error
          end
            render :new
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
flash[:failure]=@user.errors.full_message
            redirect_to edit_user_path(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :password_confirmation)
    end
end
