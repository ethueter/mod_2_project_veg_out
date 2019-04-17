class ReviewsController < ApplicationController
    def show
        @review=Review.find(params[:id])
        @current_user=current_user
    end

    def new
        @review=Review.new
        @restaurant=Restaurant.find(params[:id])
        @current_user=current_user
    end

    def create
        @review=Review.new(review_params)
        if  @review.valid?
            @review.save
            redirect_to review_path(@review)
        else
flash[:create_review_fail]="Your review could not be submitted. Please check that all fields contain valid entries."
            redirect_to edit_review_path(@review)
        end
    end

    def edit
        @review=Review.find(params[:id])
        @restaurant=Review.find(params[:id]).restaurant
    end

    def update
        @review=Review.find(params[:id])
        if  @review.update(review_params)
flash[:update_review_success]="Your review has been updated."
            redirect_to review_path(@review)
        else
flash[:update_review_fail]="There was an error while updating your review. Please try again."
            redirect_to edit_review_path(@review)
        end
    end

    def destroy
        @review=Review.find(params[:id])
        @review.destroy
        redirect_to restaurant_path(params[:restaurant_id])
    end

    private

    def review_params
        params.require(:review).permit(:user_id, :restaurant_id, :title, :rating, :price_range, :favorite_dish)
    end
end
