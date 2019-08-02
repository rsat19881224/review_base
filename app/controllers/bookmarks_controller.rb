class BookmarksController < InheritedResources::Base

  private

    def bookmark_params
      params.require(:bookmark).permit(:user_id, :school_id)
    end

end
