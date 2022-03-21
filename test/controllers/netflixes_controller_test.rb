require "test_helper"

class NetflixesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @netflix = netflixes(:one)
  end

  test "should get index" do
    get netflixes_url, as: :json
    assert_response :success
  end

  test "should create netflix" do
    assert_difference('Netflix.count') do
      post netflixes_url, params: { netflix: { cast: @netflix.cast, country: @netflix.country, date_added: @netflix.date_added, description: @netflix.description, director: @netflix.director, duration: @netflix.duration, listed_in: @netflix.listed_in, rating: @netflix.rating, release_year: @netflix.release_year, show_id: @netflix.show_id, show_type: @netflix.show_type, title: @netflix.title } }, as: :json
    end

    assert_response 201
  end

  test "should show netflix" do
    get netflix_url(@netflix), as: :json
    assert_response :success
  end

  test "should update netflix" do
    patch netflix_url(@netflix), params: { netflix: { cast: @netflix.cast, country: @netflix.country, date_added: @netflix.date_added, description: @netflix.description, director: @netflix.director, duration: @netflix.duration, listed_in: @netflix.listed_in, rating: @netflix.rating, release_year: @netflix.release_year, show_id: @netflix.show_id, show_type: @netflix.show_type, title: @netflix.title } }, as: :json
    assert_response 200
  end

  test "should destroy netflix" do
    assert_difference('Netflix.count', -1) do
      delete netflix_url(@netflix), as: :json
    end

    assert_response 204
  end
end
