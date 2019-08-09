class ReviewsController < InheritedResources::Base
  def index
    @search = Review.includes(tags: :reviews).all.search(params[:q])
    @reviews = @search.result
  end

  def new
    @review = Review.new
    @review.tags.build
  end

  def create
	@review = Review.new(review_params)

	respond_to do |format|
	  if @review.save
		format.html { redirect_to reviews_url, notice: '新しく投稿されました' }
		format.json { render :index, status: :created, location: reviews_url }
	  else
		format.html { render :new }
		format.json { render json: @review.errors, status: :unprocessable_entity }
	  end
	end
  end

  def tagAutocomplete
    @tags = Tag.all.where('name LIKE ?', "%#{params[:term]}%")
    render json: @tags.map{ |tag| {name:tag.name}}.to_json
  end

  private

    def review_params
      params.require(:review).permit(:school_id, :user_id, :rate, :content,
      tags_attributes: [
        :name 
      ])
    end

end
