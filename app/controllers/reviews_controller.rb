class ReviewsController < InheritedResources::Base

  private

    def review_params
      params.require(:review).permit(:school_id, :user_id, :rate, :content)
    end

end
