require "application_system_test_case"

class ContriesTest < ApplicationSystemTestCase
  setup do
    @contry = contries(:one)
  end

  test "visiting the index" do
    visit contries_url
    assert_selector "h1", text: "Contries"
  end

  test "creating a Contry" do
    visit contries_url
    click_on "New Contry"

    fill_in "Name", with: @contry.name
    click_on "Create Contry"

    assert_text "Contry was successfully created"
    click_on "Back"
  end

  test "updating a Contry" do
    visit contries_url
    click_on "Edit", match: :first

    fill_in "Name", with: @contry.name
    click_on "Update Contry"

    assert_text "Contry was successfully updated"
    click_on "Back"
  end

  test "destroying a Contry" do
    visit contries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contry was successfully destroyed"
  end
end
