class SchoolsController < InheritedResources::Base
  def index
    @search = School.search(params[:q])
    @schools = @search.result
    @schools = @schools.page(params[:page]).per(10)
  end

  private

    def school_params
      #params.require(:school).permit(:name, :kana, :email, :post_code, :tel, {images: []})
      params.require(:school).permit(:name, :kana, :email, :post_code, :tel, :image)
    end

end
