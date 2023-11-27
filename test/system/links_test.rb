require "application_system_test_case"

class LinksTest < ApplicationSystemTestCase
  setup do
    @link = links(:one)
  end

  test "visiting the index" do
    visit links_url
    assert_selector "h1", text: "Links"
  end

  test "should create link" do
    visit links_url
    click_on "New link"

    fill_in "Expires at", with: @link.expires_at
    fill_in "Key digest", with: @link.key_digest
    fill_in "Link type", with: @link.link_type
    fill_in "Name", with: @link.name
    fill_in "Remaining accesses", with: @link.remaining_accesses
    fill_in "Slug string", with: @link.slug_string
    fill_in "Url", with: @link.url
    click_on "Create Link"

    assert_text "Link was successfully created"
    click_on "Back"
  end

  test "should update Link" do
    visit link_url(@link)
    click_on "Edit this link", match: :first

    fill_in "Expires at", with: @link.expires_at
    fill_in "Key digest", with: @link.key_digest
    fill_in "Link type", with: @link.link_type
    fill_in "Name", with: @link.name
    fill_in "Remaining accesses", with: @link.remaining_accesses
    fill_in "Slug string", with: @link.slug_string
    fill_in "Url", with: @link.url
    click_on "Update Link"

    assert_text "Link was successfully updated"
    click_on "Back"
  end

  test "should destroy Link" do
    visit link_url(@link)
    click_on "Destroy this link", match: :first

    assert_text "Link was successfully destroyed"
  end
end
