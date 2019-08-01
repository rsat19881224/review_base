class SchoolsController < InheritedResources::Base

  private

    def school_params
      params.require(:school).permit(:name, :kana, :email, :post_code, :tel)
    end

end
