require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link = links(:one)
  end

  test "should get index" do
    get links_url
    assert_response :success
  end

  test "should get new" do
    get new_link_url
    assert_response :success
  end

  test "should create link" do
    assert_difference("Link.count") do
      post links_url, params: { link: { expires_at: @link.expires_at, key_digest: @link.key_digest, link_type: @link.link_type, name: @link.name, remaining_accesses: @link.remaining_accesses, slug_string: @link.slug_string, url: @link.url } }
    end

    assert_redirected_to link_url(Link.last)
  end

  test "should show link" do
    get link_url(@link)
    assert_response :success
  end

  test "should get edit" do
    get edit_link_url(@link)
    assert_response :success
  end

  test "should update link" do
    patch link_url(@link), params: { link: { expires_at: @link.expires_at, key_digest: @link.key_digest, link_type: @link.link_type, name: @link.name, remaining_accesses: @link.remaining_accesses, slug_string: @link.slug_string, url: @link.url } }
    assert_redirected_to link_url(@link)
  end

  test "should destroy link" do
    assert_difference("Link.count", -1) do
      delete link_url(@link)
    end

    assert_redirected_to links_url
  end
end
