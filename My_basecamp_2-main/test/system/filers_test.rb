require "application_system_test_case"

class FilersTest < ApplicationSystemTestCase
  setup do
    @filer = filers(:one)
  end

  test "visiting the index" do
    visit filers_url
    assert_selector "h1", text: "Filers"
  end

  test "should create filer" do
    visit filers_url
    click_on "New filer"

    fill_in "Description", with: @filer.description
    fill_in "Project", with: @filer.project_id
    click_on "Create Filer"

    assert_text "Filer was successfully created"
    click_on "Back"
  end

  test "should update Filer" do
    visit filer_url(@filer)
    click_on "Edit this filer", match: :first

    fill_in "Description", with: @filer.description
    fill_in "Project", with: @filer.project_id
    click_on "Update Filer"

    assert_text "Filer was successfully updated"
    click_on "Back"
  end

  test "should destroy Filer" do
    visit filer_url(@filer)
    click_on "Destroy this filer", match: :first

    assert_text "Filer was successfully destroyed"
  end
end
