module Something # rename this to your app's main namespace/module.
  class CategoryRouteMatcher
    def self.matches? request
      # TODO check subcategory name as well
      return true if Category.find_by_name(request.params[:category_name])
    end
  end
end

Routes::Application.routes.draw do
  constraints Something::CategoryRouteMatcher do
    match '/:category_name/:subcategory_name' => "categories#index", :as => :category
  end
end
