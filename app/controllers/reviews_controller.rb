class ReviewsController < ApplicationController
    def new 
        @pig = Pig.find(params[:pig_id])
        @review = Review.new
        authorize @pig
    end 
    def create
        @pig = Pig.find(params[:pig_id])
        @review = Review.new(review_params)
        @review.user = current_user
        @review.pig = @pig
        authorize @pig
        if @review.save
          redirect_to pig_path(@pig)
        else
          render :new
        end
      end
    
      private
    
      def review_params
        skip_policy_scope
        params.require(:review).permit(:review)
      end
end
