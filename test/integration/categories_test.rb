require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest
  test "the truth" do
    Category.create! :name => "joe-category"
    get '/joe-category/something-else'
    assert_equal 'Category found! name is joe-category.  Subcategory name is something-else', response.body

    # Missing category
    assert_raise(ActionController::RoutingError) do
      get '/doesnt/exist'
    end

    Category.create! :name => "doesnt"
    get '/doesnt/exist'
    assert_equal "Category found! name is doesnt.  Subcategory name is exist", response.body
  end
end
