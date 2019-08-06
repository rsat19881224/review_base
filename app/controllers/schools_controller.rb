class SchoolsController < InheritedResources::Base
  def index
    @search = School.search(params[:q])
    @schools = @search.result
  end

  private

    def school_params
      params.require(:school).permit(:name, :kana, :email, :post_code, :tel)
    end

end
