class ReviewsController < InheritedResources::Base
  def index
    @search = Review.search(params[:q])
    @reviews = @search.result
  end
  private

    def review_params
      params.require(:review).permit(:school_id, :user_id, :rate, :content)
    end

end
